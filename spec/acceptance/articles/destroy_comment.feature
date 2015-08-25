Feature: Article Comment Destroying
  As admin user
  I want to delete comment to article
  So other users can not see comment to article

  Scenario: admin user can remove comment to article
    Given I am logged as admin user
    And created article and comment to this article
    And opened article page
    When I click 'Destroy comment' button and confirm action
    Then I should not see comment on article page