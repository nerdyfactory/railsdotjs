require 'rails_dot_js/daemon'
require 'rails_dot_js/execution'

module RailsDotJs
	def self.included(base)
    base.send(:include, Daemon)
    base.send(:include, Execution)
	end
end
