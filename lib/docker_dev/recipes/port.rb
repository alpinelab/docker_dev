module DockerDev
  module Recipes
    class Port
      VARIABLE_NAME = 'PORT'.freeze

      class << self
        def option
          '--port NUMBER'
        end

        def description
          'change "expose ports", modify environment'
        end
      end

      def initialize configs, port
        @configs = configs.dup
        @port = Integer port
      end

      def apply
        @configs.tap do |o|
          o[:docker_compose]['services']['app']['environment'] =
            { VARIABLE_NAME => @port }
          o[:docker_compose]['services']['app']['ports'] =
            [([@port] * 2).join(?:)]
        end
      end
    end
  end
end
