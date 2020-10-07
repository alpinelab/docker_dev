require 'optparse'
require 'yaml'

require 'docker_dev/cli'
require 'docker_dev/config_generator'
require 'docker_dev/recipes'
require 'docker_dev/recipes/pgadmin'
require 'docker_dev/recipes/postgresql'
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
