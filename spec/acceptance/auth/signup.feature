@signup_steps
Feature: Sign Up
  As user 
  I want to sign up to the system
  So I can login with a new account
  
  Scenario: user can open sign up page via menu
    Given opened home page
    When I click sign up menu item on home page
    Then I should be redirected to SignUp page

  Scenario: user can sign up with correct credentials
    Given opened sign up page
    When I fill and submit form with correct data
    Then I should not be logged to the system
    And I should see info on home page that confirmation link has been sent to email address
    And I should receive confirmation email
    When I confirm account from confirmation email
    Then I should see info on login page that account was successfully confirmed
    When I fill and submit form with correct data on login page
    Then I should be logged to the system
    And I should be redirected to home page

  Scenario: user can not sign up with blank data
    Given opened sign up page
    When I fill and submit form with blank all fields
    Then I should see info on sign up page that email and password can't be blank
    When I fill and submit form with blank 'Password' and 'Password confirmation' fields
    Then I should see info on sign up page that password can't be blank
    When I fill and submit form with blank 'Email' field
    Then I should see info on sign up page that email can't be blank

  Scenario: user can not sign up with incorrect data
    Given opened sign up page
    When I fill and submit form with not email data in 'Email' field
    Then I should see info on sign up page that email data is incorrect
    When I fill and submit form with identical data less then 8 characters in 'Password' and 'Password confirmation' fields
    Then I should see info on sign up page that password is too short
    When I fill and submit form with not identical data in 'Password' and 'Password confirmation' fields
    Then I should see info on sign up page that password confirmation doesn't match password

  @p1
  Scenario: user cannot sign up with duplicated email
    Given registered user in the system
    And opened sign up page
    When I fill and submit form with email data which is already used by user in 'Email' field
    Then I should see info on sign up page that email has already been taken
