Feature: Log In
  As user 
  I want to use my credentials to login the system
  So I can login the system

  @bvt
  Scenario: user can open login page via menu
    Given opened home page
    When I click login menu item on home page
    Then I should be redirected to login page

  @bvt
  Scenario: user can login with correct credentials
    Given I am logged as user
    And opened login page
    When I fill and submit form on login page with correct data
    Then I should be logged to the system
    And I should be redirected to home page

  @bvt @bug
  Scenario: user can login with remembering credentials
    Given I am logged as user
    And opened login page
    When I fill and submit form on login page with correct data
    And I check 'Remember me' checkbox
    Then I should be logged to the system
    And I should be redirected to home page
    When I logout from the system
    And I open login page
    Then I should see user's email in email field and filled password field on login form
    When I submit form on login page
    Then I should be logged to the system
    And I should be redirected to home page

  @p1
  Scenario: user can not login with blank data
    Given I am logged as user
    And opened login page
    When I fill and submit form on login page with blank password field
    Then I should not be logged to the system
    And I should see info on login page that password or email is invalid
    When I fill and submit form on login page with blank email field
    Then I should not be logged to the system
    And I should see info on login page that password or email is invalid
    When I fill and submit form on login page with blank all fields
    Then I should not be logged to the system
    And I should see info on login page that password or email is invalid
      
  @p1
  Scenario: user can not login with incorrect data
    Given I am logged as user
    And opened login page
    When I fill and submit form on login page with not user's email data
    Then I should not be logged to the system
    And I should see info on login page that password or email is invalid
    When I fill and submit form on login page with not user's password data
    Then I should not be logged to the system
    And I should see info on login page that password or email is invalid
    When I fill and submit form on login page with not user's password and email data
    Then I should not be logged to the system
    And I should see info on login page that password or email is invalid

  @bvt
  Scenario: user can not login until confirmation email is not confirmed
    Given opened sign up page
    When I fill and submit form on sign up page with correct data
    Then I should not be logged to the system
    And I should be redirected to home page
    And I should see info on home page that confirmation link has been sent to my email
    When I fill and submit login form on login page with correct user's data
    Then I should not be logged to the system
    And I should see info on login page that I have to confirm account before continuing

  @bvt
  Scenario: canceled user can not login
    Given I am logged as user
    And opened edit account page
    When I click 'Cancel account' button and confirm action
    Then I should see info on home page that account was cancelled
    When I fill and submit Login form on login page with correct user' data
    Then I should not be logged to the system
    And I should see info on login page that password or email is invalid