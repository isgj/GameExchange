Feature: Authentication
  Background:
    Given I am on the "home" page

  Scenario: Sign up user
    When I click the "Sign up" "link"
    Then I should be on the "sign up" page
    When I fill in "Email" with "user@example.com"
    And I fill in "user_password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click the "Sign up" "button"
    Then I should be on the "home" page
    And I should see the "Log out"

  Scenario: Log in user
    When I click the "Log in" "link"
    Then I should be on the "sign in" page
    When I fill in "Email" with "pass@test.com"
    And I fill in "Password" with "testpassword"
    And I click the "Log in" "button"
    Then I should be on the "home" page
    And I should see the "Log out"

  Scenario: OAuth with Google
    When I click the "Log in" "link"
    Then I should be on the "sign in" page
    When I click the "Sign in with Google" "link"
    Then I should be on the "home" page
    And I should see the "Log out"

  Scenario: OAuth with Facebook
    When I click the "Log in" "link"
    Then I should be on the "sign in" page
    When I click the "Sign in with Facebook" "link"
    Then I should be on the "home" page
    And I should see the "Log out"
