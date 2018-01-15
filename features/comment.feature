Feature: Comments

  Scenario: See my comments
    Given I am the user "one"
    And I am on the "gamer" page of "one"
    When I click the "My comments" "link"
    Then I should be on the "gamer comments" page of "one"
    When I click the "Back" "link"
    Then I should be on the "gamer" page of "one"

  Scenario: See user's comments
    Given I am the user "one"
    And I am on the "gamer" page of "two"
    When I click the "User's comments" "link"
    Then I should be on the "gamer comments" page of "two"
    When I click the "Back" "link"
    Then I should be on the "gamer" page of "two"

  Scenario: Try to comment a user but then change my mind
    Given I am the user "one"
    And I am on the "gamer" page of "four"
    When I click the "Review user" "link"
    Then I should be on the "gamer new comment" page of "four"
    When I click the "Back" "link"
    Then I should be on the "gamer" page of "four"

  Scenario: Testing create edit delete comment
    Given I am the user "one"
    And I am on the "gamer" page of "four"
    When I click the "Review user" "link"
    Then I should be on the "gamer new comment" page of "four"
    When I fill in "Review:" with "Good user"
    When I click the "Create Comment" "button"
    Then I should be on the "gamer comments" page of "four"
    When I click the "Back" "link"
    Then I should be on the "gamer" page of "four"
    When I click the "Show review" "link"
    Then I should be on the "show review" page of "four"
    When I click the "edit" "link"
    Then I should be on the "gamer edit comment" page of "four"
    When I fill in "Review" with "Bad user"
    When I click the "Update Comment" "button"
    Then I should be on the "gamer" page of "four"
    When I click the "Show review" "link"
    Then I should be on the "show review" page of "four"
    Then I click the "Delete" "button"
    Then I click the "Delete" "link"
    Then I should be on the "gamer" page of "four"
