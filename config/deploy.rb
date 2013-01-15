set :application, "bornloved"
set :repository,  "https://github.com/johncalvinyoung/bornloved"

set :scm, :git
set :user, 'bornloved'

role :web, "bornloved.org"                          # Your HTTP server, Apache/etc
role :app, "bornloved.org"                          # This may be the same as your `Web` server
role :db,  "bornloved.org", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
