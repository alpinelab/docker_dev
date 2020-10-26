require 'optparse'
require 'pathname'
require 'yaml'

require 'docker_dev/cli'
require 'docker_dev/config_files_writer'
require 'docker_dev/configs_generator'
require 'docker_dev/recipe'
require 'docker_dev/recipes'
require 'docker_dev/recipes/compose_file_format'
require 'docker_dev/recipes/compose_services_app_image_tag'
require 'docker_dev/recipes/heroku'
require 'docker_dev/recipes/mailcatcher'
require 'docker_dev/recipes/pgadmin'
require 'docker_dev/recipes/port'
require 'docker_dev/recipes/postgresql'
require 'docker_dev/recipes/procfile'
require 'docker_dev/recipes/vscode_remote_config'
require 'docker_dev/recipes/webpacker'

module DockerDev
  class << self
    def merge_deep original, other
      original.merge other do |_, a, b|
        if Hash === a && Hash === b
          merge_deep a, b
        else
          b
        end
      end
    end
  end
end
