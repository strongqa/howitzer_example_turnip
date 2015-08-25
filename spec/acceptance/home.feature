@ok
Feature: Home

  Scenario: visitor can see home page of web application
    Given I am logged to the system as admin user
    And created article
    When I open home page
    Then I should see today form on home page with correct article title