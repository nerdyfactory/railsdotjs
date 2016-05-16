module RailsDotJs
  module Execution
    def execute_node(file)
      Dir.chdir(fetch_config(:node_path)) do
        node_cmd = ENV['NVM_BIN'] ? "#{ENV['NVM_BIN']}/node" : "node"
        system "#{node_cmd} #{file}"
      end
    end
  end
end
