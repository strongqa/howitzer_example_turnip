@articles_list_steps @smoke
Feature: Article list
  As user
  I want to view my articles
  So I can view my articles in article list

  Scenario: user can see articles in Article list
    Given there is user in the system
    And I am logged to the system as user
    And there is an article
    When I open articles list page
    Then I should see article in articles list page with correct article parameters

  Scenario: user can find necessary articles by name in Article list
    Given there is user in the system
    And I am logged to the system as user
    And there is an article
    When I open articles list page
    And I search necessary article in right sidebar on article list page
    Then I should be redirected to search page
    And I should see article on search page

  Scenario: user can see and open recently created articles in right sidebar of Article list
    Given there is user in the system
    And I am logged to the system as user
    And there is an article
    When I open articles list page
    Then I should see created article in recent post on article list page
    When I click on article in recent post on article list page
    Then I should be redirected to article page
    And I should see article parameters on article page
