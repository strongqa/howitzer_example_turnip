Feature: Article Comment Adding
  As user
  I want to add comment to article
  So other users can see my comment to article

  Background:
    Given I am logged to the system as user
    And created article
    And opened article page

  Scenario: user can add comment with not blank data
    When I fill and submit new comment form on article page
    Then I should see info that comment was succesfully added
    And I should see created comment on article page

  Scenario: user can not add comment with blank data
    When I submit new comment form on article page with blank data
    Then I should see info that comment can't be blank