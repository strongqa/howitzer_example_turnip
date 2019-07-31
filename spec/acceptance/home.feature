@home_steps @smoke
Feature: Home

  Scenario: visitor can see home page of web application
    Given there is an article
    And I am logged to the system as admin user
    When I open home page
    Then I should see today form on home page with correct article title

  @exception
  Scenario: visitor can see howitzer banner
    When I open home page
    And I open quick start on howitzer frame
    Then I should see install section on howitzer frame
