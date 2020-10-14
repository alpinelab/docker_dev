Feature: MailCatcher service configuration

  Scenario: adds MailCatcher configuration directives
    When I successfully run `docker_dev --mailcatcher`
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
        mailcatcher:
          image: schickling/mailcatcher
          ports:
            - 1080:1080
      """
