Feature: Users can see titles

  Background:
  Given I am the user "one"
  And I am on the "titles" page

  Scenario: Search by name and visit title
    When I fill in "Name of the game" with "super"
    And I click the "Search" "button"
    Then I should see the "Super game 1"
    And I should not see the "Funny play"
    When I click the "Show game page" "link"
    Then I should see the "Super game 1"
