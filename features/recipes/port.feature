Feature: Port number modification

  Scenario: changes "expose ports" and adds `PORT' environment variable
    When I successfully run `docker_dev --port 8000`
    Then the output must match YAML:
      """
      version: '3'
      services:
        app:
          image: alpinelab/ruby-dev
          environment:
            PORT: 8000
          ports:
            - 8000:8000
          volumes:
            - .:/app
            - bundle:/bundle
            - config:/config
      """
