module DockerDev
  module Recipes
    class ComposeFileFormat
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

      def initialize configs, compose_file_format
        @configs = configs
        @compose_file_format = compose_file_format
      end

      def apply
        @configs.inject({}) do |acc, (filename_id, content)|
          acc.merge filename_id => if FILENAME_IDS.include? filename_id
            content.merge 'version' => @compose_file_format
          else
            content
          end
        end
      end
    end
  end
end
