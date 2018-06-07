@users_list_steps
@view_user_steps

Feature: Users List
  As admin user
  I want to see users registered in system
  So I can see Users list

  Scenario: admin user is viewing users in Users list
    Given I am logged to the system as admin user
    And there is user in the system
    When I click 'Users' menu item
    Then I should be redirected to users page
    And I should see user's email signed up on today's date

  Scenario: admin user can see users data on user page
    Given there is user1 in the system
    And there is admin user in the system
    And I am logged to the system as existed admin user
    And I am on users page
    When I click on user1 name on users page
    Then I should see user1 name on users page
    When I click on my name on users page
    Then I should see my name on users page
