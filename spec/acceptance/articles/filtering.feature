@articles_filtering
Feature: Articles filtering
  As user
  I want to filter my articles
  So I can filter my articles by category in article list

  Scenario: user can filter article by category
    Given there is an article category
    And there is an article1 with special category
    And there is an article2 with special category
    And there is user in the system
    And I am logged to the system as user
    When I open articles list page
    Then I should see category of created articles in right sidebar on article list page
    When I click on category in right sidebar on article list page
    Then I should be redirected to categories page
    And I should see two articles on categories page

