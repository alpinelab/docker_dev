module DockerDev
  module Recipes
    class PostgreSQL
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

      def initialize configs, image = nil
        @configs = configs.dup
        @image = image
      end

      def apply
        @configs.tap do |o|
          o[:docker_compose] = DockerDev.merge_deep o[:docker_compose], CONFIG
          next unless @image
          o[:docker_compose]['services']['postgres']['image'] += ?: + @image
        end
      end
    end
  end
end
