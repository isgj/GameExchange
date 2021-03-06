Feature: User can block and unblock
  Background:
    Given I am the user "one"

  Scenario: Show blocked user list
    Given I am on the "gamer" "one" page
    When I click the "blocked users" "link"
    Then I should be on the "blocks" page of "one"
    And I should see the "Pierus"

  Scenario: Block a user
    Given I am the user "one"
    And I am on the "gamer" "two" page
    When I click the "Block" "button"
    Then I should be on the "gamer" page of "two"
    And I should see "Unblock" button

  Scenario: Unblock a user
    Given I am on the "gamer" "three" page
    When I click the "Unblock" "button"
    Then I should be on the "gamer" page of "three"
    And I should see "Block" button
