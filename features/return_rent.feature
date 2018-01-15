Feature: Return the game

  Scenario: User can return a rented game
    Given I am the user "one"
    And I am on the "game" page of "rented"
    When I click the "Return this game" "link"
    Then I should be on the "game" page of "rented"
    And I should see the "Back from rent"
    And I should not see the "Markus Aurelius"
