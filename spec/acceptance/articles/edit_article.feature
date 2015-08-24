Feature: Article Editing
  As user 
  I want to edit my article
  So other users can see my edited article

  Background:
    Given logged to the system as admin user
    And opened article list page with created article

  Scenario: user can edit article with correct data
    When I click Edit article button on article list page
    And I fill and submit form on edit article page with new correct data
    Then I should see article with new data on article page

  Scenario: user can not edit article with blank title
    When I click Edit article button on article list page
    And I fill and submit form on edit article page with blank data in 'Title' field
    Then I should see info that title can't be blank
      
  Scenario: user can not edit article with too short title
    When I click Edit article button on article list page
    And I fill and submit form on edit article page with data less then 5 characters in 'Title' field
    Then I should see info that title is too short