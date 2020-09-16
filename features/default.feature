Feature: Default configuration

  Scenario: prints default configuration
    When I successfully run `docker_dev`
    Then the output should contain exactly:
      """
      ---
      version: '3'
      services:
        app:
          image: alpinelab/ruby-dev
          volumes:
          - ".:/app"
      """
