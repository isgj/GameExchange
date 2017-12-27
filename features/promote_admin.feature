Feature: Admins can promote other users as amdins

  Scenario: Promote to admin
    Given I am the user "admin"
    And I am on the "gamer" page of "one"
    When I click the "Promote to admin" "link"
    Then I should be on the "gamer" page of "one"
    And I should see the "Administrator"
