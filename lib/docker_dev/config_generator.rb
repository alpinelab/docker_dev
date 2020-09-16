require 'yaml'

module DockerDev
  class ConfigGenerator
    CONFIGS = {
      base: {
        'version' => ?3,
        'services' => {
          'app' => {
            'image' => 'alpinelab/ruby-dev',
            'volumes' => %w[.:/app]
          }
        }
      },
      postgresql: {
        'volumes' => {
          'postgres-data' => {
            'driver' => 'local'
          }
        },
        'services' => {
          'postgres' => {
            'image' => 'postgres',
            'volumes' => %w[postgres-data:/var/lib/postgresql/data],
            'environment' => {
              'POSTGRES_PASSWORD' => 'password'
            }
          }
        }
      }
    }

    def initialize
      @config = CONFIGS[:base]
    end

    def add id
      @config = deep_merge @config, CONFIGS.fetch(id)
    end

    def dump
      YAML.dump @config
    end

  private

    def deep_merge original, other
      original.merge other do |_, a, b|
        if Hash === a && Hash === b
          deep_merge a, b
        else
          b
        end
      end
    end
  end
end
