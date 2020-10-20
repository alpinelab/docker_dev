module DockerDev
  class ConfigFilesWriter
    CONFIG_FILENAMES = {
      docker_compose: 'docker-compose.yaml'.freeze
    }.freeze

    class << self
      def write configs
        configs.each do |filename_id, content|
          File.write CONFIG_FILENAMES[filename_id],
            case content
              when String then content
              else YAML.dump content
            end
        end
      end
    end
  end
end
