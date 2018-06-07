@view_user_steps
Feature: User Viewing
  As a user
  I want to view users data
  So I can see users data on user's page

  Scenario: user can see users data on user page
    Given there is user2 in the system
    And I am logged to the system as user2
    When I am trying to navigate to users page
    Then I should be redirected to home page
