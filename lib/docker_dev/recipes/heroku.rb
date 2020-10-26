module DockerDev
  module Recipes
    class Heroku < Recipe
      VARIABLE_NAME = 'HEROKU_API_KEY'.freeze

      class << self
        def option
          '--heroku KEY'
        end

        def description
          'set Heroku API key as environment variable'
        end
      end

      def apply
        @configs.tap do |o|
          o[:docker_compose]['services']['app']['environment'] = {
            VARIABLE_NAME => @arg
          }
        end
      end
    end
  end
end
