## OS processes within each dyno to allow app to support multiple concurrent requests
## Range : 2-4 Unicorn worker processes but may vary specific memory footprint
#worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
#
#timeout 15
#
## reduces the startup time of individual Unicorn worker_processes
#preload_app true
#
#before_fork do |server, worker|
#  Signal.trap 'TERM' do
#    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
#    Process.kill 'QUIT', Process.pid
#  end
#
#  defined?(ActiveRecord::Base) and
#    ActiveRecord::Base.connection.disconnect!
#end 
#
#after_fork do |server, worker|
#  Signal.trap 'TERM' do
#    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
#  end
#
#  defined?(ActiveRecord::Base) and
#    ActiveRecord::Base.establish_connection
#end