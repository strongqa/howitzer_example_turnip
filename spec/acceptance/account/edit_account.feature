Feature: Account Editing
  As user
  I want to edit my account
  So I can change my name, password and email

  Scenario: user can edit password and name with correct data
    Given I am logged to the system as user
    And opened edit account page
    When I fill and submit form on edit account page with correct new data in 'Name', 'Password' and 'Password confirmation' fields
    Then I should see info on home page that account has been successfully edited
    When I log out
    And I fill form on login page with correct email and new password
    Then I should be logged in the system
    When I open edit account page
    Then I should see newly created data in 'Name' field

  Scenario: user can edit email with correct credentials
    Given I am logged to the system as user
    And opened edit account page
    When I fill and submit form on edit account page with correct new email data in 'Email' field
    Then I should see info that I need to confirm new email
    When I confirm new account from confirmation instruction email
    Then I should see info that email was confirmed
    When I log out
    And I fill form on login page with correct new email and password
    Then I should be logged in the system
    When I open edit account page
    Then I should see newly created data in 'Email' field

  Scenario: user can not edit account with incorrect email
    Given I am logged to the system as user
    And opened edit account page
    When I fill and submit form on edit account page with not email data in 'Email' field
    Then I should see info that email is not correct

  Scenario: user can not edit account with existing email
    Given there is registered user with "email@test.com"
    And I am logged to the system as user with another email
    And opened edit account page
    When I fill and submit form on edit account page with "email@test.com" data in 'Email' field
    Then I should see info that email has already been taken

  Scenario: user can not edit account with incorrect password
    Given I am logged to the system as user
    And opened edit account page
    When I fill and submit form on edit account page with not correct password in 'Current password'
    Then I should see info that current password is incorrect

  Scenario: user can not edit account with incorrect password confirmation
    Given I am logged to the system as user
    And opened edit account page
    When I fill and submit form on edit account page with not identical data in 'Password' and 'Passsword confirmation' fields
    Then I should see info that password confirmation doesn't match password

  Scenario: user can not edit account with short password (less then 8 characters)
    Given I am logged to the system as user
    And opened edit account page
    When I fill and submit form on edit account page with data less then 8 characters in 'Password' and 'Passsword confirmation' fields
    Then I should see info that password is too short (minimum is 8 characters)