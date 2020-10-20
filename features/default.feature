Feature: Default configuration

  Scenario: writes default configuration
    When I successfully run `docker_dev`
    Then the content of "docker-compose.yaml" file must match YAML:
      """
      version: '3'
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
