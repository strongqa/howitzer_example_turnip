Feature: Article Adding
  As a user
  I want to add a new article
  So other users can see my article

  Background:
    Given I am logged to the system as admin user
    And opened article list page

  Scenario: user can add article with correct data
    When I click new article button on article list page
    And I fill and submit form on new article page with correct data
    Then I should see newly created article with correct data on article page 
    When I open article list page
    Then I should see newly created article with correct data on article list page 

  Scenario: user can not add article with blank title
    When I click new article button on article list page
    And I fill and submit form on new article page with blank data in 'Title' field
    Then I should see info that title can't be blank

  Scenario: user can not add article with too short title
    When I click new article button on article list page
    And I fill and submit form on new article page with data less then 5 characters in 'Title' field
    Then I should see info that title is too short