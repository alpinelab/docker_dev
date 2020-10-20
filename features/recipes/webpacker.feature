Feature: Webpacker service configuration

  Scenario: adds Webpacker configuration directives
    When I successfully run `docker_dev --webpacker`
    Then the content of "docker-compose.yaml" file must match YAML:
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
            - bundle:/bundle
            - config:/config
            - node_modules:/app/node_modules
          environment:
            WEBPACKER_DEV_SERVER_HOST: 0.0.0.0
      volumes:
        node_modules:
          driver: local
      """
