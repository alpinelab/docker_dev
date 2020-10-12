module DockerDev
  module Recipes
    class Heroku
      VARIABLE_NAME = 'HEROKU_API_KEY'.freeze

      class << self
        def option
          '--heroku KEY'
        end

        def description
          'set Heroku API key as environment variable'
        end
      end

      def initialize input, key
        @input = input.dup
        @key = key
      end

      def apply
        @input.tap do |o|
          o['services']['app']['environment'] = { VARIABLE_NAME => @key }
        end
      end
    end
  end
end
