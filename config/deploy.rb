set :application, "cia"

set :scm, :git
set :repository,  "git@codebasehq.com:amaabca/internal/cia.git"
set :branch, "origin/master"
set :user, "deploy"
set :deploy_to, "/home/deploy/public_html/cia"

default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }
set :stages, %w(staging production)
set :default_stage, "staging"

require 'capistrano/ext/multistage'

namespace :deploy do
  desc "Deploy the MFer"
  task :default do
    update
    restart
    cleanup
  end

  desc "Setup a GitHub-style deployment."
  task :setup, :except => { :no_release => true } do
    run "git clone #{repository} #{current_path}"
    update
    run "mkdir -p #{current_path}/tmp/sockets && mkdir -p #{current_path}/tmp/pids"
    db.create
    migrate
    seed
    start
    cleanup
    nginx.setup
  end

  desc "Update the deployed code."
  task :update_code, :except => { :no_release => true } do
    run "cd #{current_path}; git fetch origin; git reset --hard #{branch}"
  end

  desc "Deploy and run migrations"
  task :migrations, :except => { :no_release => true } do
    update
    migrate
    restart
    cleanup
  end

  desc "Run pending migrations on already deployed code"
  task :migrate, :only => {:primary => true}, :except => { :no_release => true } do
    run "cd #{current_path}; rake RAILS_ENV=#{stage} db:migrate"
  end

  desc "Seed the database on already deployed code"
  task :seed, :only => {:primary => true}, :except => { :no_release => true } do
    confirm = Capistrano::CLI.ui.ask "This is a dangerous task. Type Y to continue."
    exit unless confirm.downcase == 'y'
    run "cd #{current_path}; rake RAILS_ENV=#{stage} db:seed"
  end
    
  namespace :db do  
    
    task :create do
      run "cd #{current_path}; rake RAILS_ENV=#{stage} db:create"
    end
    
    desc "Wipe tables then rerun all migrations and seed database"
    task :remigrate, :only => {:primary => true}, :except => { :no_release => true } do
      confirm = Capistrano::CLI.ui.ask "This is a dangerous task. Type Y to continue."
      exit unless confirm.downcase == 'y'
      run "cd #{current_path}; rake RAILS_ENV=#{stage} db:remigrate"
    end
  end
        
  namespace :rollback do
    desc "Rollback"
    task :default do
      code
    end
    
    desc "Rollback a single commit."
    task :code, :except => { :no_release => true } do
      set :branch, "HEAD^"
      default
    end
  end
  
  task :symlink, :roles => :app, :except => { :no_release => true } do
  end
  
  task :cleanup, :roles => :app, :except => { :no_release => true } do
  end
  
  # override default tasks to make capistrano happy
  desc "Start unicorn"
  task :start do
    run "cd #{current_path} && bundle exec unicorn -c #{current_path}/config/unicorn.rb -E #{stage} -D"
  end

  desc "Kick unicorn"
  task :restart do
    run "kill -USR2 `cat #{current_path}/tmp/pids/unicorn.pid`"
  end

  desc "Kill a unicorn"
  task :stop do
    run "kill -QUIT `cat #{current_path}/tmp/pids/unicorn.pid`"
  end  
  
  namespace :web do
    desc "Serve up a custom maintenance page."
    task :disable, :roles => :web do
      require 'erb'
      on_rollback { run "rm #{current_path}/public/system/maintenance.html" }
      
      reason = ENV['REASON']
      deadline = ENV['UNTIL']
      
      template = File.read(File.join("app/views/system/maintenance.html.erb"))
      page = ERB.new(template).result(binding)
      
      put page, "#{current_path}/public/system/maintenance.html", :mode => 0644
    end
    
    desc "Remove a custom maintenance page."
    task :enable, :roles => :web do
      run "rm #{current_path}/public/system/maintenance.html"
    end
  end  
end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end
 
  task :bundle_new_release, :roles => :app do
    #bundler.create_symlink
    run "cd #{current_path} && bundle install --deployment --quiet --without development test cucumber"
  end
end

namespace :nginx do
  task :setup, :roles => :web do
    run "cp #{current_path}/config/etc/nginx/#{application} /etc/nginx/sites-available/#{application}"
    sudo "ln -s /etc/nginx/sites-available/#{application} /etc/nginx/sites-enabled/#{application}"
    puts "Now restart nginx to view your site"
  end
end
 
after 'deploy:update_code', 'bundler:bundle_new_release'