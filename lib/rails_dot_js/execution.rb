module RailsDotJs
  module Execution

    def execute_node(file)
      Dir.chdir(fetch_config(:node_path)) do
        system("#{node_cmd} #{file}")
      end
    end

    def damonize_node(file)
      Dir.chdir(fetch_config(:node_path)) do
        exec("#{node_cmd} #{file}")
      end
    end

    private
    def node_cmd
      ENV['NVM_BIN'] ? "#{ENV['NVM_BIN']}/node" : "node"
    end
  end
end
