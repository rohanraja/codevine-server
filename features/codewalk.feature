Feature: Full codewalk scenario

  @single
  Scenario: Create dotnet project, add hooks, run and verify codewalk
    Given I create a dot net app with id "3"
    And I clear database
    And I run codevine parser on the project
    And I run the project
    And I wait for 5 seconds
    When I visit the codewalk page
    And I wait for 2 seconds
    And I perform forward walk test with id "3"


  @all
  Scenario: CodeWalk for all test cases
    Then I run codewalk test on app with id "1"
    Then I run codewalk test on app with id "2"
    Then I run codewalk test on app with id "3"

  # Scenario: Using web client for code walk
  #   When I visit the codewalk page
  #   And I wait for 1 seconds
  #   Then I should see "CodeVines" on that page
  #   And I perform forward walk test with id "1"

