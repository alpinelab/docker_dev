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
        deep_merge @input, CONFIG
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
end
