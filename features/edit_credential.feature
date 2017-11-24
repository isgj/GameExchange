Feature: Logged user can edit his profile

#This scenario is not complete
Scenario: Edit credential
  Given I am the user "test"
  And I am on the "edit user" page
  When I fill in "New password" with "newpassword"
  And I fill in "Password confirmation" with "newpassword"
  And I fill in "Current password" with "testpassword"
  And I click the "Update" "button"
  Then I should be on the "home" page

Scenario: Delete profile
  Given I am the user "test"
  And I am on the "edit user" page
  When I click the "delete" "link"
  And I click the "Confirm" "button"
  Then I should be on the "home" page
  And I should see the "Sign up"
