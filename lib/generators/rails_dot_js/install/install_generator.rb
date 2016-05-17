require 'rails/generators/active_record'

module RailsDotJs
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc 'prepare node.js working environment'
      argument :name, type: :string, default: ""
      source_root File.expand_path('../templates', __FILE__)

      def self.source_root
        File.expand_path('../test', __FILE__)
      end

      def setup_directory
        puts "test"
        empty_directory 'app/nodejs'
        template 'package.json', 'app/nodejs/package.json'
      end

      def add_node_modules_to_gitignore
        append_to_file '.gitignore' do
          "\n" + %w[#railsdotjs app/nodejs/node_modules app/nodejs/npm-debug.log].join("\n") + "\n"
        end
      end
    end
  end
end
