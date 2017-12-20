Feature: Owner can accept a request

  Background:
    Given I am the user "one"
    And I am on the "desire" page of "two"

  Scenario: Owner can accept a sale request
    When I choose "status_1"
    And I click the "Accept" "button"
    Then I should be on the "game" page of "one"
    And I should see the "Commodus"
    And I should see the "Bought it"

  Scenario: Owner can accept a gift request
    When I choose "status_2"
    And I click the "Accept" "button"
    Then I should be on the "game" page of "one"
    And I should see the "Commodus"
    And I should see the "Gift"

  Scenario: Owner can accept a gift request
    When I choose "status_3"
    And I click the "Accept" "button"
    Then I should be on the "game" page of "one"
    And I should see the "Commodus"
    And I should see the "Rented"
