Feature: Admin can update console

  Scenario: Admin can update console info
    Given I am the user "admin"
    And I am on the "title" page of "three"
    When I click the "Platform2" "link"
    Then I should be on the "platform" page of "two"
    When I click the "Update info" "link"
    Then I should be on the "edit platform" page of "two"
    When I fill in "name" with "New platform"
    And I click the "update" "button"
    Then I should be on the "platform" page of "two"
    And I should see the "New platform"
