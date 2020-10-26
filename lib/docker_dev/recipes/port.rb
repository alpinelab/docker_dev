module DockerDev
  module Recipes
    class Port < Recipe
      VARIABLE_NAME = 'PORT'.freeze

      class << self
        def option
          ['--port NUMBER', Integer]
        end

        def description
          'change "expose ports", modify environment'
        end
      end

      def apply
        @configs.tap do |o|
          o[:docker_compose]['services']['app']['environment'] =
            { VARIABLE_NAME => @arg }
          o[:docker_compose]['services']['app']['ports'] =
            [([@arg] * 2).join(?:)]
        end
      end
    end
  end
end
