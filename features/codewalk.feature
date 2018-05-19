Feature: Full codewalk scenario

  Scenario: Create dotnet project, add hooks, run and verify codewalk
    Given I create a dot net app with id "1"
    And I clear database
    And I run codevine parser on the project
    And I run the project
    When I visit the codewalk page
    And I wait for 1 seconds
    Then I should see "CodeVines" on that page
    And I perform forward walk test with id "1"

  # Scenario: Using web client for code walk
  #   When I visit the codewalk page
  #   And I wait for 1 seconds
  #   Then I should see "CodeVines" on that page
  #   And I perform forward walk test with id "1"

