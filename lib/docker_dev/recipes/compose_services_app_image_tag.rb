module DockerDev
  module Recipes
    class ComposeServicesAppImageTag < Recipe
      class << self
        def option
          '--ruby IMAGE_TAG'
        end

        def description
          'changes the tag of `app\' service image'
        end
      end

      def apply
        @configs.inject({}) do |acc, (filename_id, content)|
          acc.merge filename_id => if filename_id == :docker_compose
            DockerDev.merge_deep content, {
              'services' => {
                'app' => {
                  'image' => [
                    content.dig('services', 'app', 'image'),
                    @arg
                  ].join(?:)
                }
              }
            }
          else
            content
          end
        end
      end
    end
  end
end
