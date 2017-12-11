Feature: Modify a game

  Background:
    Given I am the user "test"
    And I am on the "game" page of "three"

  Scenario: User can update status of the game
    When I select "Owned" from "game[state]"
    And I click the "Change status" "button"
    Then I should see the "The status of the game was updated"

  Scenario: User can delete the game
    When I click the "Delete" "link"
    Then I should be on the "gamer" page of "test"
    And I should see the "Game was successfully destroyed"
