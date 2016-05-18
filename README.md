# railsdotjs
railsdotjs is gem providing node.js environment in Rails applications, so that you don't need to keep seperate repository for node application.
Any suggestion of new features or bug reporting are appreciated.

## Requirements
- [node.js](https://nodejs.org/)
- [Ruby on Rails](http://rubyonrails.org/)
- [Redis](http://www.redis.io/): supporting messaging between rails and node application

## Installation
Add the following to your application's Gemfile:
``` ruby
gem 'railsdotjs', :git => 'https://github.com/nerdyfactory/railsdotjs'
```

and bundling application
```
$ bundle install
```

generating node working space
```
$ rails g rails_dot_js:install
```

now you can play with node stuff in ```app/nodejs``` directory

## Usages
### options
```RailsDotJs``` has two options. using ```set_config``` and ```fetch_config``` methods, you can set and fetch the value.
If you will use default value of the option, you don't need set the value

| Option  | Description |
| ------------- | ------------- |
| :node_path  | name of the directory where node scripts are (default: app/nodejs) |
| :node_env  | a value will be passed as NODE_ENV environment variable (default: ENV["RAILS_ENV"]|| "development") |

### Simple execution
you can just run node script use ``` execute_node ``` method after include ```RailsDotJS``` module

``` ruby
class NodeExecution
  include RailsDotJs
  def run(file_name)
    execute_node(file_name)
  end
end

NodeExecution.new.run("someNodeFile.js")
```
### Daemon
In most of case, you will use node.js script as some server. For this case you can run node script as daemon with template.
To generate template, you can run following command
```
# rails g rails_dot_js:daemon DAEMON_NAME
```
It will create two scripts in ```script``` directory.
``` DAEMON_NAME_ctrl``` and ```DAEMON_NAME```

The content of the script ```DAEMON_NAME``` should be like this. you need to specify your script from ```daemonize_node``` part.
``` ruby
#!/usr/bin/env ruby


require 'rubygems'
require 'bundler/setup'
require 'railsdotjs'

class DaemonNameRunner
  include RailsDotJs
  def run
    set_config(:node_path, "#{File.dirname __FILE__}/../app/nodejs")
    ## it replace current process with the command executed so that it can be managed by daemons gem
    # daemonize_node("someNodeScriptHere.js")
  end
end

DaemonNameRunner.new.run
```
And you can start, stop and restart the daemon with following command
```
$ bundle exec script/DAEMON_NAME_ctrl start
$ bundle exec script/DAEMON_NAME_ctrl stop
$ bundle exec script/DAEMON_NAME_ctrl restart
```

pids files should be in ```tmp/pids``` directory

RailsDotJs uses awsome [Daemons](https://github.com/thuehlinger/daemons) gem to manage the process and we referred [this](https://coderwall.com/p/mrpebq/background-daemons-in-your-rails-app-with-the-daemons-gem) article to make generator.


## Contribution
Fork, fix and make a pull request
