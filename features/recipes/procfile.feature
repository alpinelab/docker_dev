Feature: foreman integration

  Scenario: creates various files for foreman
    When I successfully run `docker_dev --procfile`
    Then the file "Procfile" should contain exactly:
      """
      web: bin/bundle rails server --b 0.0.0.0
      """
    Then the file "Procfile.dev" should be equal to file "Procfile"
    And the content of ".foreman" file must match YAML:
      """
      procfile: Procfile.dev
      """
