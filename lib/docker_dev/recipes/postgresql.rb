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
          '--postgresql [image tag]'
        end

        def description
          'use PostgreSQL'
        end
      end

      def initialize input, image = nil
        @input = input
        @image = image
      end

      def apply
        out = DockerDev.merge_deep @input, CONFIG
        if @image
          out['services']['postgres']['image'] += ?: + @image
        end
        out
      end
    end
  end
end
