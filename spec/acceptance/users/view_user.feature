@view_user_steps
Feature: User Viewing
  As a user
  I want to view users data
  So I can see users data on user's page

  Scenario: user can see users data on user page
    Given there is user1 in the system
    And there is user2 in the system
    And I am logged to the system as user2
    And I am on users page
    When I click on user1 email on users page
    Then I should be redirected to users page
    And I should see user1 email on users page
    When I click on my email on users page
    Then I should be redirected to users page
    And I should see my email on users page
    When I click on admin email on users page
    Then I should be redirected to users page
    And I should see admin email on users page