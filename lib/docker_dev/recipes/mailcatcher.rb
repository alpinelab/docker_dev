module DockerDev
  module Recipes
    class MailCatcher
      SERVICE = {
        'mailcatcher' => {
          'image' => 'schickling/mailcatcher',
          'ports' => %w[1080:1080]
        }
      }

      class << self
        def option
          '--mailcatcher'
        end

        def description
          'use MailCatcher'
        end
      end

      def initialize input, _
        @input = input.dup
      end

      def apply
        @input.tap do |o|
          o['services'] = o['services'].merge SERVICE
        end
      end
    end
  end
end
