#require 'pry'
#require 'daemons'
#daemon_options = {
#  app_name: "rails_dot_js",
#  dir_mode: :normal,
#  dir: File.expand_path('tmp/pids'),
#  log_dir: File.expand_path('log'),
#  logfilename: "aaa",
#  log_output: true # redirect STDOUT and STDERR to log file
#}
#puts daemon_options
#app_group = Daemons::ApplicationGroup.new("rails_dot_js", daemon_options)
#app_group.setup
#app_group.applications.each do |app|
#  puts app.pid
#  puts app.pid.number
#end
system("node spec/fixtures/daemon.js")
