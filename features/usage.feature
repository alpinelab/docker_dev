Feature: Program usage

  Scenario: reports error and prints the usage when unknown option is given
    When I run `docker_dev --unkwnown-option`
    Then the exit status should be 64
    And the stderr should contain exactly:
      """
      Usage: docker_dev [options]
          -h, --help                       print this message
              --postgresql                 use PostgreSQL
      """
    And the stdout should not contain anything

  Scenario: prints the usage when -h argument is given
    When I successfully run `docker_dev -h`
    Then the output should contain exactly:
      """
      Usage: docker_dev [options]
          -h, --help                       print this message
              --postgresql                 use PostgreSQL
      """
