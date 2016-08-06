@edit_account_steps
Feature: Account Editing
  As user
  I want to edit my account
  So I can change my name, password and email

  Scenario: user can edit password and name with correct data
    Given there is user in the system
    And I am logged to the system as user
    And I am on edit account page
    When I fill and submit form on edit account page with correct new data
    Then I should see following text on home page:
    """
    You updated your account successfully.
    """
    When I log out
    Then I should not be logged to the system
    When I fill form on login page with correct email and new password
    Then I should be logged to the system
    When I open edit account page
    Then I should see newly created data

  Scenario: user can edit email with correct credentials
    Given there is user in the system
    And I am logged to the system as user
    And I am on edit account page
    When I fill and submit form on edit account page with correct new email data
    Then I should see following text on home page:
    """
    You updated your account successfully, but we need to verify your new email address. Please check your email and click on the confirm link to finalize confirming your new email address.
    """
    When I confirm new account from confirmation instruction email
    Then I should see following text on home page:
    """
    Your account was successfully confirmed.
    """
    When I log out
    And I fill form on login page with correct new email and password
    Then I should be logged to the system
    And I should see following text on home page:
    """
    Signed in successfully.
    """

  @p1
  Scenario: user can not edit account with incorrect email
    Given there is user in the system
    And I am logged to the system as user
    And I am on edit account page
    When I fill and submit form on edit account page with incorrect email
    Then edit account page should be displayed

  Scenario: user can not edit account with existing email
    Given there is user1 in the system
    And there is user2 in the system
    And I am logged to the system as user2
    And I am on edit account page
    When I fill and submit form on edit account page with user1 data in 'Email' field
    Then I should see following text on edit account page:
    """
    1 error prohibited this user from being saved: Email has already been taken
    """

  @p1
  Scenario: user can not edit account with incorrect password
    Given there is user in the system
    And I am logged to the system as user
    And I am on edit account page
    When I fill and submit form on edit account page with not correct password in 'Current password' field
    Then I should see following text on edit account page:
    """
    1 error prohibited this user from being saved: Current password is invalid
    """

  @p1
  Scenario: user can not edit account with incorrect password confirmation
    Given there is user in the system
    And I am logged to the system as user
    And I am on edit account page
    When I fill and submit form on edit account page with different 'Password' and 'Passsword confirmation' fields
    Then I should see following text on edit account page:
    """
    1 error prohibited this user from being saved: Password confirmation doesn't match Password
    """

  @p1
  Scenario: user can not edit account with short password (less than 8 characters)
    Given there is user in the system
    And I am logged to the system as user
    And I am on edit account page
    When I fill and submit form on edit account page less than 8 chars in 'Password' and 'Passsword confirmation' fields
    Then I should see following text on edit account page:
    """
    1 error prohibited this user from being saved: Password is too short (minimum is 8 characters)
    """
