module DockerDev
  class ConfigFilesWriter
    CONFIG_FILENAMES = {
      devcontainer: '.devcontainer/devcontainer.json'.freeze,
      devcontainer_docker_compose: '.devcontainer/docker-compose.yml'.freeze,
      docker_compose: 'docker-compose.yaml'.freeze,
      docker_compose_override: 'docker-compose.override.yaml'.freeze,
      foreman: '.foreman'.freeze,
      procfile: 'Procfile'.freeze,
      procfile_dev: 'Procfile.dev'.freeze
    }.freeze

    class << self
      def write configs
        configs.each do |filename_id, content|
          write_file Pathname(CONFIG_FILENAMES[filename_id]),
            case content
              when String then content
              else YAML.dump content
            end
        end
      end

    private

      def write_file path, content
        path.dirname.mkpath unless path.dirname.exist?
        File.write path, content
      end
    end
  end
end
