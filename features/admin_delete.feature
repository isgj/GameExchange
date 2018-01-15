Feature: Admins can delete other users

  Scenario: Delete not admin users
    Given I am the user "admin"
    And I am on the "gamer" page of "delete_me"
    When I click the "Delete" "link"
    Then I should be on the "gamers" page
