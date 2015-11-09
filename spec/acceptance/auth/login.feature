@login_steps
Feature: Log In
  As user 
  I want to use my credentials to login the system
  So I can login the system

  @smoke
  Scenario: user can open login page via menu
    Given there is user in the system
    And I am on home page
    When I click login menu item
    Then I should be redirected to login page

  Scenario: user can login with correct credentials
    Given there is user in the system
    And I am on login page
    When I fill and submit form on login page with correct data
    Then I should be logged to the system
    And I should be redirected to home page

  @bug
  Scenario: user can login with remembering credentials
    Given there is user in the system
    And I am on login page
    When I fill and submit form on login page with check 'Remember me' checkbox
    Then I should be logged to the system
    And I should be redirected to home page
    When I close my browser
    And I come back next time
    Then I should be logged to the system

    When I log out
    Then I should not be logged to the system
    When I close my browser
    And I come back next time
    Then I should not be logged to the system

  @p1
  Scenario: user can not login with blank data
    Given there is user in the system
    And I am on login page
    When I fill and submit form on login page with blank password field
    Then I should not be logged to the system
    And I should see following text on login page:
    """
    Invalid email or password.
    """
    When I fill and submit form on login page with blank email field
    Then I should not be logged to the system
    And I should see following text on login page:
    """
    Invalid email or password.
    """
    When I fill and submit form on login page with blank all fields
    Then I should not be logged to the system
    And I should see following text on login page:
    """
    Invalid email or password.
    """

  @p1
  Scenario: user can not login with incorrect data
    Given there is user in the system
    And I am on login page
    When I fill and submit form on login page with incorrect email data
    Then I should not be logged to the system
    And I should see following text on login page:
    """
    Invalid email or password.
    """
    When I fill and submit form on login page with incorrect password data
    Then I should not be logged to the system
    And I should see following text on login page:
    """
    Invalid email or password.
    """
    When I fill and submit form on login page with incorrect password and email data
    Then I should not be logged to the system
    And I should see following text on login page:
    """
    Invalid email or password.
    """

  Scenario: user can not login until confirmation email is not confirmed
    Given I am on sign up page
    When I fill and submit form on sign up page with correct data
    Then I should not be logged to the system
    And I should be redirected to home page
    And I should see following text on home page:
    """
    A message with a confirmation link has been sent to your email address. Please open the link to activate your account.
    """
    When I open login page
    And I fill and submit form on login page with correct data
    Then I should not be logged to the system
    And I should see following text on login page:
    """
    You have to confirm your account before continuing.
    """
  Scenario: canceled user can not login
    Given there is user in the system
    And I am logged to the system as user
    And I am on edit account page
    When I click on cancel my account button on edit account page and confirm action
    Then I should see following text on home page:
    """
    Bye! Your account was successfully cancelled. We hope to see you again soon.
    """
    When I open login page
    And I fill and submit form on login page with correct data
    Then I should not be logged to the system
    And I should see following text on login page:
    """
    Invalid email or password.
    """