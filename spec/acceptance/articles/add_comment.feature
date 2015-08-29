@add_comment_steps
Feature: Article Comment Adding
  As user
  I want to add comment to article
  So other users can see my comment to article

  Background:
    Given there is an article
    And there is user in the system
    And I am logged to the system as user
    And I am on an article page

  Scenario: user can add comment with not blank data
    When I fill and submit new comment form on article page
    Then I should see following text on article page:
    """
    Comment was successfully added to current article.
    """
    And I should see created comment on article page

  Scenario: user can not add comment with blank data
    When I submit new comment form on article page with blank data
    Then I should see following text on article page:
    """
    Body can't be blank
    """