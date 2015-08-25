Feature: Account Cancelling
  As user 
  I don't want to login the system
  So I can cancel my account

  Scenario: user can cancel his account
    Given I am logged to the system as user
    And opened edit account page
    When I click on 'Cancel my account' button on edit account page and confirm action
    Then I should see info that account has been successfully cancelled