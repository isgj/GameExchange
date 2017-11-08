Feature: Authentication
  Background:
    Given I am on the homepage

  Scenario: Sign up user
    When I click the "Sign up" "link"
    Then I should be on the "sign up" page
    When I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click the "Sign up" "button"
    And I should be on the "home" page
    And I should see the "Log out" button

  Scenario: Log in user
    Given I have a user with email address "user@example.com"
    When I click the "Log in" "link"
    Then I should be on the "sign in" page
    When I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I click the "Log in" "button"
    Then I should be on the "home" page
    And I should see the "Log out" button

  Scenario: OAuth with Google
    When I click the "Log in" "link"
    Then I should be on the "sign in" page
    When I click the "Sign in with Google" "link"
    Then I should be on the "home" page
    And I should see the "Log out" button
