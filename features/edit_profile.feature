Feature: Logged user can edit his profile

  Scenario: Edit profile
    Given I am the user "one"
    And I am on the "gamer" "one" page
    When I click the "Edit your profile" "link"
    Then I should be on the "edit gamer" page of "one"
    When I fill in "Insert your phone" with "39222222"
    And I click the "Save changes" "button"
    Then I should be on the "gamer" page of "one"
    And I should see the "39222222"
