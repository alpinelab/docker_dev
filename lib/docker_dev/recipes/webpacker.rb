module DockerDev
  module Recipes
    class Webpacker
      CONFIG = {
        'services' => {
          'app' => {
            'environment' => {
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

      def initialize configs, _
        @configs = configs.dup
      end

      def apply
        @configs.tap do |o|
          o[:docker_compose]['services']['app']['ports'] += %w[3035:3035]
          o[:docker_compose]['services']['app']['volumes'] +=
            %w[node_modules:/app/node_modules]
          o[:docker_compose] = DockerDev.merge_deep o[:docker_compose], CONFIG
        end
      end
    end
  end
end
