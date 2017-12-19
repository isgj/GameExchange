Feature: User can handle requests

  Background:
    Given I am the user "one"

  Scenario: User can create a request for a game
    Given I am on the "game" page of "three"
    When I check "status1"
    And I click the "Save" "button"
    Then I should be on the "game" page of "three"
    And I should see the "Your request was saved"

  Scenario: User can update a request for a game
    Given I am on the "game" page of "two"
    When I check "status2"
    And I click the "Update" "button"
    Then I should be on the "game" page of "two"
    And I should see the "Your request was updated"

  Scenario: User can delete a request for a game
    Given I am on the "game" page of "two"
    When I click the "Delete" "link"
    Then I should be on the "game" page of "two"
    And I should see the "Your request was successfully destroyed"
