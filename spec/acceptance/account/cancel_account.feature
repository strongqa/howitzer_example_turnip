@cancel_account_steps
Feature: Account Cancelling
  As user 
  I don't want to login the system
  So I can cancel my account

  Scenario: user can cancel his account
    Given there is user in the system
    And I am logged to the system as user
    And I am on edit_account page
    When I click on cancel my account button on edit account page and confirm action
    Then I should see following text on home page:
    """
    Bye! Your account was successfully cancelled. We hope to see you again soon.
    """