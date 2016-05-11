module RailsDotJs
  module Execution
    DEFAULT_OPTIONS = {
      envs: {
        NODE_ENV: ENV["RAILS_ENV"]
      },
      path: File.expand_path('app/nodejs')
    }
    def execute_script(file, options = default_options)
      env_string = options[:envs].map do |k, v|
        "#{k}=#{v}"
      end.join(" ")
      Dir.chdir(options[:path]) do
        %x["#{["node", "#{options[:path]}/#{file}", env_string].join(" ")}"]
      end
    end

    private
    def default_options
      DEFAULT_OPTIONS
    end
  end
end
