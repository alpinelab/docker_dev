Feature: Webpacker service configuration

  Scenario: adds Webpacker configuration directives
    When I successfully run `docker_dev --webpacker`
    Then the output must match YAML:
      """
      version: '3'
      services:
        app:
          image: alpinelab/ruby-dev
          ports:
            - 5000:5000
            - 3035:3035
          volumes:
            - .:/app
          environment:
            PORT: 3000
            WEBPACKER_DEV_SERVER_HOST: 0.0.0.0
      """
