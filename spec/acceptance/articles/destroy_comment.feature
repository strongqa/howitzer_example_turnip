@destroy_comment_steps
Feature: Article Comment Destroying
  As admin user
  I want to delete comment to article
  So other users can not see comment to article

  Scenario: admin user can remove comment to article
    Given I am logged to the system as admin user
    And there is an article with created by admin user comment to this article
    And I open this article page
    When I click destroy comment button and confirm action
    Then I should not see comment on article page