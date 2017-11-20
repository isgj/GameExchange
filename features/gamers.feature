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
