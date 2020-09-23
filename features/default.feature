Feature: Default configuration

  Scenario: prints default configuration
    When I successfully run `docker_dev`
    Then the output must match YAML:
      """
      version: '3'
      services:
        app:
          image: alpinelab/ruby-dev
          ports:
            - 5000:5000
          volumes:
            - .:/app
      """
