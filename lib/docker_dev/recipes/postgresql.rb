module DockerDev
  module Recipes
    class PostgreSQL < Recipe
      CONFIG = {
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

      class << self
        def option
          '--postgresql [IMAGE_TAG]'
        end

        def description
          'use PostgreSQL'
        end
      end

      def apply
        @configs.tap do |o|
          o[:docker_compose] = DockerDev.merge_deep o[:docker_compose], CONFIG
          next unless @arg
          o[:docker_compose]['services']['postgres']['image'] += ?: + @arg
        end
      end
    end
  end
end
