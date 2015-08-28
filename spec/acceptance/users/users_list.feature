@users_list_steps
Feature: Users List
  As user 
  I want to see users registered in system
  So I can see Users list

  Scenario: user is viewing users in Users list
    Given there is user in the system
    And I am logged to the system as user
    When I click 'Users' menu item
    Then I should be redirected to users page
    And I should see user's email signed up on today's date