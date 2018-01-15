Feature: Users can search
  Background:
    Given I am on the "gamers" page

  Scenario: Search by name
    When I fill in "name" with "Marcus"
    And I click the "search" "button"
    Then I should see the "Marcus Aurelius"
    And I should not see the "Commodus"

  Scenario: Search by city
    When I fill in "city" with "Rome"
    And I click the "search" "button"
    Then I should see the "Marcus Aurelius"
    And I should see the "Commodus"

  Scenario: Search by name and city
    When I fill in "name" with "Marcus"
    And I fill in "city" with "Rome"
    And I click the "search" "button"
    Then I should see the "Marcus Aurelius"
    And I should not see the "Commodus"

  Scenario: Not logged user cannot visit profile
    When I fill in "city" with "Rome"
    And I click the "search" "button"
    Then I should see the "Marcus Aurelius"
    And I should not see the "Visit profile"
    And I should see the "Log in to view more"

  Scenario: Logged users can see visit link
    Given I am the user "one"
    When I fill in "name" with "Commodus"
    And I click the "search" "button"
    Then I should see the "Commodus"
    And I should see the "Visit profile"

  Scenario: Search won't show private profile
    Then I should not see the "No name"
