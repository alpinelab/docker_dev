module DockerDev
  class ConfigsGenerator
    BASE = {
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
    }

    def initialize
      @configs = { docker_compose: BASE }
    end

    def add_recipe recipe, arg
      @configs = recipe.new(@configs, arg).apply
    end

    def configs
      @configs
    end
  end
end
