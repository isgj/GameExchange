Feature: Admin can update title

  Scenario: Admin can update title info
    Given I am the user "admin"
    And I am on the "title" page of "three"
    When I click the "Update info" "link"
    Then I should be on the "edit title" page of "three"
    When I fill in "Summary" with "New description"
    And I click the "Update" "button"
    Then I should be on the "title" page of "three"
    And I should see the "New description"
