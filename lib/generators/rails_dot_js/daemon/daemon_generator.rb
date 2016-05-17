require 'rails/generators/active_record'

module RailsDotJs
  module Generators
    class DaemonGenerator < ActiveRecord::Generators::Base
      desc 'create daemon_script template'
      source_root File.expand_path('../templates', __FILE__)

      def self.source_root
        File.expand_path('../templates', __FILE__)
      end

      def setup_directory
        empty_directory 'script'
      end

      def copy_templates
        template "daemon_script.erb", "script/#{name.downcase}"
        template "controll_script.erb", "script/#{name.downcase}_ctrl"
      end

      def chmod_scripts
        chmod "script/#{name.downcase}", 0755 
        chmod "script/#{name.downcase}_ctrl", 0755 
      end
    end
  end
end
