# Minimal sample configuration file for Unicorn (not Rack) when used
# with daemonization (unicorn -D) started in your working directory.
#
# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.
# See also http://unicorn.bogomips.org/examples/unicorn.conf.rb for
# a more verbose configuration using more features.

listen 3000 # by default Unicorn listens on port 8080
worker_processes 1 # this should be >= nr_cpus
pid "/var/www/bornloved/shared/pids/unicorn.pid"
stderr_path "/var/www/bornloved/shared/log/unicorn.log"
stdout_path "/var/www/bornloved/shared/log/unicorn.log"
working_directory "/var/www/bornloved/current"

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end


