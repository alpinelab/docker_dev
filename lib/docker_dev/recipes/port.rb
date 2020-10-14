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

      def initialize input, port
        @input = input.dup
        @port = Integer port
      end

      def apply
        @input.tap do |o|
          o['services']['app']['environment'] = { VARIABLE_NAME => @port }
          o['services']['app']['ports'] = [([@port] * 2).join(?:)]
        end
      end
    end
  end
end
