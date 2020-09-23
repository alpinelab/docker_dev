require 'yaml'

module DockerDev
  class ConfigGenerator
    BASE = {
      'version' => ?3,
      'services' => {
        'app' => {
          'image' => 'alpinelab/ruby-dev',
          'ports' => %w[5000:5000],
          'volumes' => %w[.:/app]
        }
      }
    }

    def initialize
      @config = BASE
    end

    def add_recipe recipe, arg
      @config = recipe.new(@config, arg).apply
    end

    def dump
      YAML.dump @config
    end
  end
end
