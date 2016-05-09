require 'rails/generators/active_record'

module RailsDotJs
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc 'prepare node.js working environment'
      source_root File.expand_path('../templates', __FILE__)

      def self.source_root
        File.expand_path('../templates', __FILE__)
      end

      def setup_directory
        empty_directory 'app/nodejs'
        template 'package.json', 'app/nodejs/package.json'
      end

      def add_node_modules_to_gitignore
        #append_to_file '.gitignore' do 
				#	'app/nodejs/node_modules'
				#	'app/nodejs/npm-debug.log'
				#end
      end
    end
  end
end
