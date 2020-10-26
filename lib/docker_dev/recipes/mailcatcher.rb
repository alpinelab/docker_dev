module DockerDev
  module Recipes
    class MailCatcher < Recipe
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

      def apply
        @configs.tap do |o|
          o[:docker_compose]['services'] =
            o[:docker_compose]['services'].merge SERVICE
        end
      end
    end
  end
end
