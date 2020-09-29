module DockerDev
  module Recipes
    class Webpacker
      CONFIG = {
        'services' => {
          'app' => {
            'environment' => {
              'PORT' => 3000,
              'WEBPACKER_DEV_SERVER_HOST' => '0.0.0.0'
            }
          }
        },
        'volumes' => {
          'node_modules' => {
            'driver' => 'local'
          }
        }
      }

      class << self
        def option
          '--webpacker'
        end

        def description
          'use Webpacker'
        end
      end

      def initialize input, _
        @input = input.dup
      end

      def apply
        @input['services']['app']['ports'] += %w[3035:3035]
        @input['services']['app']['volumes'] +=
          %w[node_modules:/app/node_modules]
        DockerDev.merge_deep @input, CONFIG
      end
    end
  end
end
