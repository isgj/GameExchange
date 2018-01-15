Feature: User can check his requests

  Scenario: Check my requests
    Given I am the user "one"
    And I am on the "gamer" page of "one"
    When I click the "Show your game requests" "link"
    Then I should be on the "requests" page
    And I should see the "Funny play"
    And I should see the "delete_forever"
