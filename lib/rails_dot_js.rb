require 'rails_dot_js/daemon'
require 'rails_dot_js/execution'


module RailsDotJs

	def self.included(base)
    base.send(:include, Daemon)
    base.send(:include, Execution)
	end

  #implement block later
  def set_config(key, value)
    _config[key] = value
  end

  def fetch_config(key)
    _config[key]
  end

  private
  def _config
    @config ||= _default_config
  end

  def _default_config
    {
      node_path: File.expand_path('app/nodejs'),
      node_env: ENV["RAILS_ENV"] || 'development'
    }
  end
end
