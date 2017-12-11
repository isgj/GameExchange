Feature: Friends features
  Background:
    Given I am the user "one"

  Scenario: Show friend list
    Given I am on the "gamer" "one" page
    When I click the "friends" "link"
    Then I should be on the "friends" page of "one"
    And I should see the "Commodus"

  Scenario: Send friend request
    Given I am the user "one"
    And I am on the "gamer" "three" page
    When I click the "Ask friendship" "button"
    Then I should be on the "gamer" page of "three"
    And I should see the "Your request is pending"

  Scenario: Remove friend
    Given I am on the "gamer" "two" page
    When I click the "unfriend" "button"
    Then I should be on the "gamer" page of "two"
    And I should see "Ask friendship" button
