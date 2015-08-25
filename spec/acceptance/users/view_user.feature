Feature: User Viewing
  As a user
  I want to view users data
  So I can see users data on user's page

  Scenario: user can see users data on user page
    Given I logged to the system as user
    And registered another user in the system
    And registered admin user in the system
    And opened users list page 
    When I click on another users email on users list page
    Then I should be redirected to users page
    And I should see users email on users page
    When I click on my email on users list page
    Then I should be redirected to users page
    And I should see my email on users page
    When I click on admin email on users list page
    Then I should be redirected to users page
    And I should see admin email on users page