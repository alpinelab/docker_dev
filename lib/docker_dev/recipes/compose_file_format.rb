module DockerDev
  module Recipes
    class ComposeFileFormat < Recipe
      FILENAME_IDS = %i[
        docker_compose
        docker_compose_override
      ].freeze

      class << self
        def option
          '--compose-file-format FORMAT'
        end

        def description
          'change docker compose file format'
        end
      end

      def apply
        @configs.inject({}) do |acc, (filename_id, content)|
          acc.merge filename_id => if FILENAME_IDS.include? filename_id
            content.merge 'version' => @arg
          else
            content
          end
        end
      end
    end
  end
end
