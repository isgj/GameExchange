Feature: Add new query

  Background:
    Given I am the user "one"
    And I am on the "new query" page

  Scenario: Search a query with existing games and platform
    Given I have the API mock for query
    When I fill in "query" with "new_query"
    And I click the "Search" "button"
    Then I should be on the "last query" page
    And I should see the "Super game 1"
    And I should not see the "Funny play"

  Scenario: Search a query with existing platform
    Given I have the API mock for query-game
    When I fill in "query" with "new_query"
    And I click the "Search" "button"
    Then I should be on the "last query" page
    And I should see the "New game from query"

  Scenario: Search a query without platforms
    Given I have the API mock for query-game-platform
    When I fill in "query" with "new_query"
    And I click the "Search" "button"
    Then I should be on the "last query" page
    And I should see the "Another game"
    And the platform "my-box" should be saved
