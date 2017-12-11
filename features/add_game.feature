Feature: Add a new game

  Scenario: Users can add games
    Given I am the user "one"
    And I am on the "title" page of "one"
    When I click the "Add to your collection" "link"
    Then I should be on the "new game" page
    When I select "Platform1" from "game[platform]"
    And I click the "Add" "button"
    Then I should be on the "last game" page
    And I should see the "Game was successfully created"
