set :user, "sampi"
set :scm_username, "sampi60"
set :application, "demo_app"
set :deploy_to, "/home/#{user}/www/#{application}"
set :repository, "https://github.com/#{scm_username}/#{application}.git"


set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :branch, "master"

set :use_sudo, false
ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache

set :domain, "ssh.alwaysdata.com"
server domain, :app, :web
role :db, domain, :primary => true
set :runner, user
# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts


# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
