Feature: Homepage feature
  Background:
      Given I am the user "two"

  Scenario: Open a games page
    Given I am on the "home" page
    And I should see the "Show all games catalog"
    When I click the "Show all games catalog" "link"
    Then I should be on the "games" page

  Scenario: Open a game
    Given I am on the "home" page
    And I should see the "Show the title"
    When I click the "Show the title" "link"
    Then I should be on the "title" page of "one"
