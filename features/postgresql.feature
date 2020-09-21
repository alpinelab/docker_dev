Feature: PostgreSQL service configuration

  Scenario: adds PostgreSQL configuration directives
    When I successfully run `docker_dev --postgresql`
    Then the output must match YAML:
      """
      version: '3'
      services:
        app:
          image: alpinelab/ruby-dev
          volumes:
            - .:/app
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
