@ok
Feature: Article list
  As user
  I want to view my articles
  So I can view my articles in article list

  Scenario: user can see articles in Article list
    Given logged to the system as user
    And opened article list page with created articles
    Then I should see articles in articles list page with correct data