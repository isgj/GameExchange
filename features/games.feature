Feature: Games search

  Background:
    Given I am the user "one"
    And I am on the "games" page

  Scenario: User can search game by name and visit game
    When I fill in "Name" with "uniq game"
    And I click the "Search" "button"
    Then I should see the "This is a uniq game"
    And I should not see the "Funny play"
    When I click the "Show the game" "link"
    Then I should be on the "game" page of "uniq"
    And I should see the "Delete"

  Scenario: User can search game by status
    When I select "For sale" from "state"
    And I click the "Search" "button"
    Then I should not see the "Super game 1"
    And I should see the "Funny play"

  Scenario: User can search game by city
    When I fill in "City" with "Rome"
    And I click the "Search" "button"
    Then I should not see the "No city"
    And I should see the "Super game 1"
    And I should see the "Funny play"
