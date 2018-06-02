Feature: Full codewalk scenario

  Scenario: Create dotnet project, add hooks, run and verify codewalk
    # Then I run codewalk test on app with id "3"
    Given I create a dot net app with id "3"
    And I clear database
    And I run codevine parser on the project
    And I run the project
    And I wait for 5 seconds
    When I visit the codewalk page
    And I wait for 2 seconds
    And I perform forward walk test with id "3"

  # Scenario: Using web client for code walk
  #   When I visit the codewalk page
  #   And I wait for 1 seconds
  #   Then I should see "CodeVines" on that page
  #   And I perform forward walk test with id "1"

