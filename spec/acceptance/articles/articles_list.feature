@articles_list_steps @smoke
Feature: Article list
  As user
  I want to view my articles
  So I can view my articles in article list

  Scenario: user can see articles in Article list
    Given there is user in the system
    And I am logged to the system as user
    And there is an article
    When I open articles list page
    Then I should see article in articles list page with correct article parameters