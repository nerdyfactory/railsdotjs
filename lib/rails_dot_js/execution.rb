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
      node_env = fetch_config(:node_env)
      ENV['NVM_BIN'] ? "NODE_ENV=#{node_env} #{ENV['NVM_BIN']}/node" : "NODE_ENV=#{node_env} node"
    end
  end
end
