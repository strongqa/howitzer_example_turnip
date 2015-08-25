@wip
Feature: Article Comments List
  As user
  I want to view my comments 
  So I can view my comments list on article page

Scenario: user can see comments on article page
    Given I am logged as user
    And created article and created by user comments to this article
    When I open article page
    Then I should see comments to this article with user's email in 'Commenter' heads
    And created comment data in apropriate 'Comment' heads