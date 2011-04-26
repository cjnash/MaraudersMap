set :main_server, 'staging.amaabca.com'
server "#{main_server}", :web, :app, :db, :primary => true
set :rails_env, "production"

#For now production is pointing at staging
#server "172.18.201.168", :web, :app, :primary => true
#server "172.18.201.169", :web, :app
#role :db, "172.18.201.167", :no_release => true, :primary => true

