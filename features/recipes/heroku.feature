Feature: Heroku API key declaration

  Scenario: sets given Heroku API key as an environment variable
    When I successfully run `docker_dev --heroku heroku_api_key`
    Then the output must match YAML:
      """
      version: '3'
      services:
        app:
          image: alpinelab/ruby-dev
          environment:
            HEROKU_API_KEY: heroku_api_key
          ports:
            - 5000:5000
          volumes:
            - .:/app
      """

  Scenario: reports error and prints the usage when argument is missing
    When I run `docker_dev --heroku`
    Then the exit status should be 64
    And the standard error must contain exactly the usage
    And the stdout should not contain anything
