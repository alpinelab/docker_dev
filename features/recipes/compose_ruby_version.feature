Feature: Docker compose image tag

  Scenario: changes the tag of `app' service image
    When I successfully run `docker_dev --ruby=2.7.2`
    Then the content of "docker-compose.yaml" file must match YAML:
      """
      version: '3'
      services:
        app:
          image: alpinelab/ruby-dev:2.7.2
          ports:
            - 5000:5000
          volumes:
            - .:/app
            - bundle:/bundle
            - config:/config
      """
