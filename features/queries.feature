Feature: Query features

  Background:
    Given I am the user "one"
    And I am on the "queries" page

  Scenario: Search an existent query
    When I fill in "query" with "game"
    And I click the "Search" "button"
    Then I should see the "Game"
    And I should not see the "Funny"

  Scenario: Show the results of a query
    When I click the "Funny" "link"
    Then I should be on the "query" page of "two"
    And I should see the "Funny play"
    And I should not see the "Super game 1"

  Scenario: Redirect to query if it exists
    When I click the "Make a new search" "link"
    And I fill in "query" with "funny"
    And I click the "Search" "button"
    Then I should be on the "query" page of "two"
    And I should see the "Funny play"
    And I should not see the "Super game 1"
