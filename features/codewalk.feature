Feature: Full codewalk scenario

  Scenario: Using web client for code walk
    When I visit the codewalk page
    And I wait for 1 seconds
    Then I should see "CodeVines" on that page
    And I perform forward walk test with id "1"

