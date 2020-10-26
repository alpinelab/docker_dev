Feature: VSCode remote configuration

  Scenario: creates `.devcontainer\' directory with some files
    When I successfully run `docker_dev --vscode-remote-config`
    Then the file ".devcontainer/devcontainer.json" should contain:
      """
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
      """
    And the content of ".devcontainer/docker-compose.yml" file must match YAML:
      """
      version: '3.1'
      services:
      app:
        command: /bin/sh -c "while sleep 1000; do :; done"
      """
