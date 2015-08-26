@home_steps
Feature: Home

  Scenario: visitor can see home page of web application
    Given there is an article
    And I am logged to the system as admin user
    When I open home page
    Then I should see today form on home page with correct article title