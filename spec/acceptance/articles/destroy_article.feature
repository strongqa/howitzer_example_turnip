@destroy_article_steps
Feature: Article Destroying
  As admin user
  I want to delete my article
  So other users can't see my article

  Scenario: user can remove article from articles list
    Given there is an article
    And I am logged to the system as admin user
    And I am on articles_list page
    When I click destroy button and confirm action
    Then I should not see article on articles list page
