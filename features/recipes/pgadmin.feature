Feature: PGAdmin service configuration

  Scenario: adds PGAdmin configuration directives
    When I successfully run `docker_dev --pgadmin`
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
            - bundle:/bundle
            - config:/config
        postgres:
          image: postgres
          volumes:
            - postgres-data:/var/lib/postgresql/data
        pgadmin:
          image: thajeztah/pgadmin4
          ports:
            - 5050:5050
          volumes:
            - pgadmin-config:/pgadmin
          links:
            - postgres
      volumes:
        postgres-data:
          driver: local
        pgadmin-config:
          driver: local
      """
