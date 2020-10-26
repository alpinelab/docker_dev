module DockerDev
  module Recipes
    class Procfile < Recipe
      FOREMAN_CONFIG = { 'procfile'.freeze => 'Procfile.dev'.freeze }.freeze
      PROCFILE_CONTENT = 'web: bin/bundle rails server --b 0.0.0.0'.freeze

      class << self
        def option
          '--procfile'
        end

        def description
          'creates files for foreman'
        end
      end

      def apply
        @configs.merge(
          foreman: FOREMAN_CONFIG,
          procfile: PROCFILE_CONTENT,
          procfile_dev: PROCFILE_CONTENT
        )
      end
    end
  end
end
