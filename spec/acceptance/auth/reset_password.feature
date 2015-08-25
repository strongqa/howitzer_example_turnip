@ok
Feature: Password Resetting
  As user
  I want to reset my password
  So I can login to the system with new password

  @bvt
  Scenario: user can reset password with correct data
    Given registered user in the system
    And opened login page
    When I click 'Forgot password' link on login page
    And I fill and submit form on forgot password page with correct email data
    Then I should see info that instruction has sent
    And I should receive confirmation email
    When I confirm resetting password from confirmation email
    And I fill and submit form on change password page with correct data
    Then I should be logged to the system
    And I should see info on home page that password was changed successfully

  @p1
  Scenario: user can not reset password with incorrect new password
    Given registered user in the system
    And opened login page
    When I click 'Forgot password' link on login page
    And I fill and submit form on forgot password page with correct email data
    Then I should see info that instruction has sent
    And I should receive confirmation email
    When I confirm resetting password from confirmation email
    And I fill and submit form on change password page with not identical data
    Then I should see info on change password page that password confirmation doesn't match password
    When I fill and submit form on change password page with identical data less then 8 characters
    Then I should see info on change password page that password is too short

  @p1
  Scenario: user can not reset password with incorrect email
    Given opened login page
    When I click 'Forgot password' link on login page
    And I fill and submit form on forgot password page with not existent email
    Then I should see info on forgot password page that email is not found
    When I fill and submit form on forgot password page with not email data
    Then I should see info on forgot password page that email is not correct

  @p1
  Scenario: user can login with old password until confirmation email for new password is not confirmed
    Given registered user in the system
    And opened login page
    When I click 'Forgot password' link on login page
    And I fill and submit form on forgot password page with correct email data
    Then I should see info that instruction has sent
    When I fill and submit form on login page with correct user's credentials
    Then I should be logged to the system
    And I should be redirected to home page
