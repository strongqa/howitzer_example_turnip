@reset_password_steps
Feature: Password Resetting
  As user
  I want to reset my password
  So I can login to the system with new password

  Scenario: user can reset password with correct data
    Given there is user in the system
    When I click forgot password link on login page
    And I fill and submit form on forgot password page with correct email data
    Then I should see following text on login page:
    """
    You will receive an email with instructions on how to reset your password in a few minutes.
    """
    When I receive and confirm resetting password from confirmation email
    And I fill and submit form on change password page with correct data
    Then I should be logged to the system
    And I should see following text on home page:
    """
    Your password was changed successfully. You are now signed in.
    """

  @p1
  Scenario: user can not reset password with incorrect new password
    Given there is user in the system
    When I click forgot password link on login page
    And I fill and submit form on forgot password page with correct email data
    Then I should see following text on login page:
    """
    You will receive an email with instructions on how to reset your password in a few minutes.
    """
    When I receive and confirm resetting password from confirmation email
    And I fill and submit form on change password page with not identical data
    Then I should see following text on change password page:
    """
    1 ERROR PROHIBITED THIS USER FROM BEING SAVED:
    Password confirmation doesn't match Password
    """
    When I fill and submit form on change password page with identical data less than 8 characters
    Then I should see following text on change password page:
    """
    1 ERROR PROHIBITED THIS USER FROM BEING SAVED:
    Password is too short (minimum is 8 characters)
    """

  @p1
  Scenario: user can not reset password with incorrect email
    Given there is user in the system
    When I click forgot password link on login page
    And I fill and submit form on forgot password page with blank email field
    Then I should see following text on forgot password page:
    """
    1 error must be fixed
    Email can't be blank
    """
    And I fill and submit form on forgot password page with not existent email
    Then I should see following text on forgot password page:
    """
    1 error must be fixed
    Email not found
    """
    When I fill and submit form on forgot password page with not email data
    Then forgot password page should be displayed

  Scenario: user can login with old password until confirmation email for new password is not confirmed
    Given there is user in the system
    When I click forgot password link on login page
    And I fill and submit form on forgot password page with correct email data
    Then I should see following text on login page:
    """
    You will receive an email with instructions on how to reset your password in a few minutes.
    """
    When I open login page
    And I fill and submit form on login page with correct data
    Then I should be logged to the system
    And I should be redirected to home page
