Feature: Article Destroying
  As admin user
  I want to delete my article
  So other users can't see my article

  Scenario: user can remove article from articles list
    Given logged to the system as admin user
    And opened article list page with created article
    When I click 'Destroy' button and confirm action
    Then I should not see article on article list page
