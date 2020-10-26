Feature: Docker compose file format

  Scenario: changes the file format (version)
    When I successfully run `docker_dev --compose-file-format 3.5`
    Then the content of "docker-compose.yaml" file must match YAML:
      """
      version: '3.5'
      services:
        app:
          image: alpinelab/ruby-dev
          ports:
            - 5000:5000
          volumes:
            - .:/app
            - bundle:/bundle
            - config:/config
      """
    And the content of "docker-compose.override.yaml" file must match YAML:
      """
      version: '3.5'
      services:
        app:
          environment:
      """
