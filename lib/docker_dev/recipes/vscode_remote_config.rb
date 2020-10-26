module DockerDev
  module Recipes
    class VSCodeRemoteConfig
      DEVCONTAINER_CONFIGURATION = <<~eoh
        {
          "name": "Existing Docker Compose (Extend)",
          "dockerComposeFile": [
            "../docker-compose.yml",
            "../docker-compose.override.yml",
            "docker-compose.yml"
          ],
          "service": "app",
          "workspaceFolder": "/app",
          "settings": {
            "terminal.integrated.shell.linux": null,
            "ruby.useBundler": true,
            "ruby.useLanguageServer": true,
            "ruby.lint": {
              "rubocop": {
                "useBundler": true
              }
            },
            "ruby.format": "rubocop"
          },
          "extensions": [
            "rebornix.ruby"
          ],
          "remoteUser": "user"
        }
      eoh

      DEVCONTAINER_DOCKER_COMPOSE_CONFIGURATION = {
        'version' => '3.1',
        'services' => nil,
        'app' => {
          'command' => '/bin/sh -c "while sleep 1000; do :; done"'
        }
      }

      class << self
        def option
          '--vscode-remote-config'
        end

        def description
          'create `.devcontainer\' directory'
        end
      end

      def initialize configs, _
        @configs = configs
      end

      def apply
        @configs.merge(
          devcontainer: DEVCONTAINER_CONFIGURATION,
          devcontainer_docker_compose: DEVCONTAINER_DOCKER_COMPOSE_CONFIGURATION
        )
      end
    end
  end
end
