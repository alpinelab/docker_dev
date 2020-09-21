Feature: Program usage

  Scenario: reports error and prints the usage when unknown option is given
    When I run `docker_dev --unkwnown-option`
    Then the exit status should be 64
    And the standard error must contain exactly the usage
    And the stdout should not contain anything

  Scenario: prints the usage when -h argument is given
    When I successfully run `docker_dev -h`
    Then the standard output must contain exactly the usage
