require 'yaml'

module DockerDev
  class ConfigGenerator
    BASE = {
      'version' => ?3,
      'services' => {
        'app' => {
          'image' => 'alpinelab/ruby-dev',
          'volumes' => %w[.:/app]
        }
      }
    }

    def initialize
      @config = BASE
    end

    def add_recipe recipe
      @config = recipe.new(@config).apply
    end

    def dump
      YAML.dump @config
    end
  end
end
