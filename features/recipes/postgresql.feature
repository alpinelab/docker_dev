Feature: PostgreSQL service configuration

  Scenario: adds PostgreSQL configuration directives
    When I successfully run `docker_dev --postgresql`
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
        postgres:
          image: postgres
          volumes:
            - postgres-data:/var/lib/postgresql/data
          environment:
            POSTGRES_PASSWORD: password
      volumes:
        postgres-data:
          driver: local
      """

  Scenario: forces specific "image" and "tag"
    When I successfully run `docker_dev --postgresql 12-alpine`
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
        postgres:
          image: postgres:12-alpine
          volumes:
            - postgres-data:/var/lib/postgresql/data
          environment:
            POSTGRES_PASSWORD: password
      volumes:
        postgres-data:
          driver: local
      """
