module DockerDev
  class ConfigsGenerator
    BASE = {
      docker_compose: {
        'version' => ?3,
        'services' => {
          'app' => {
            'image' => 'alpinelab/ruby-dev',
            'ports' => %w[5000:5000],
            'volumes' => %w[
            .:/app
            bundle:/bundle
            config:/config
            ]
          }
        }
      },
      docker_compose_override: {
        'version' => ?3,
        'services' => {
          'app' => {
            'environment' => nil
          }
        }
      }
    }

    def initialize
      @configs = BASE
    end

    def add_recipe recipe, arg
      @configs = recipe.new(@configs, arg).apply
    end

    def configs
      @configs
    end
  end
end
