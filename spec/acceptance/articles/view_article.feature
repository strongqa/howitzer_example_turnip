Feature: Article Viewing
  As admin user
  I want to view article page
  So I can see what article page includes

  Scenario: admin user is viewing article page
    Given logged to the system as admin user
    And created article and created by admin user comment to this article
    When I open article page
    Then I should see correct articles data on article page
    And I should see admin user comment on article page with correct comment and commenter data
    And I should see add comment form, body field on article page
    And I should see 'Edit article', 'Destroy comment', 'Create comment' buttons on article page
    When I click 'Back to articles' link on article page
    Then I should be redirected to article list page