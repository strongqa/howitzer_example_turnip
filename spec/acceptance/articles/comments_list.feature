@comments_list_steps
Feature: Article Comments List
  As user
  I want to view my comments 
  So I can view my comments list on article page

Scenario: user can see comments on article page
  Given there is user in the system
  And I am logged to the system as user
  And there is an article with created by user comments to this article
  When I open this article page
  Then I should see comments to this article with user's email in 'Commenter' heads