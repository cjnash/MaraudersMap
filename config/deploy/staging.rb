set :main_server, 'staging.amaabca.com'
server "#{main_server}", :web, :app, :db, :primary => true
set :rails_env, "staging"
