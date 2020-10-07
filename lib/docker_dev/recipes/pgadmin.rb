module DockerDev
  module Recipes
    class PGAdmin
      CONFIG = {
        'services' => {
          'postgres' => {
            'image' => 'postgres',
            'volumes' => %w[postgres-data:/var/lib/postgresql/data]
          },
          'pgadmin' => {
            'image' => 'thajeztah/pgadmin4',
            'ports' => %w[5050:5050],
            'volumes' => %w[pgadmin-config:/pgadmin],
            'links' => %w[postgres]
          }
        },
        'volumes' => {
          'postgres-data' => {
            'driver' => 'local'
          },
          'pgadmin-config' => {
            'driver' => 'local'
          }
        }
      }

      class << self
        def option
          '--pgadmin'
        end

        def description
          'use PGAdmin'
        end
      end

      def initialize input, _
        @input = input.dup
      end

      def apply
        DockerDev.merge_deep @input, CONFIG
      end
    end
  end
end
