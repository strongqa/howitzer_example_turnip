module SignupSteps
  attr_accessor :user

  # GIVEN
  step "I am on sign up page" do
    SignUpPage.open
  end

    # WHEN
  step "I click sign up menu item on home page" do
    HomePage.given.choose_menu('Sign up')
  end

  step "I fill and submit form with correct data" do
    self.user=build(:user)
      SignUpPage.
      open.fill_form(
      user_name: self.user.name ,
      email: self.user.email,
      password: self.user.password,
      password_confirmation: self.user.password).submit_form
  end

  step "I confirm account from confirmation email" do
    ConfirmationInstructionEmail.
        find_by_recipient(self.user.email).
        confirm_my_account
  end

  step "I fill and submit form with correct data on login page" do
    LoginPage.
        given.
        fill_form(email: self.user.email, password: self.user.password).
        submit_form
  end

  step "I fill and submit form with blank all fields" do
    SignUpPage.
        given.
        submit_form
  end

  step "I fill and submit form with blank 'Password' and 'Password confirmation' fields" do
    self.user=build(:user)
    SignUpPage.
        given.fill_form(
        user_name: self.user.name ,
        email: self.user.email,
        password: "",
        password_confirmation: "").submit_form
  end

  step "I fill and submit form with blank 'Email' field" do
    self.user=build(:user)
    SignUpPage.
        given.fill_form(
        user_name: self.user.name ,
        email: "",
        password: self.user.password,
        password_confirmation: self.user.password).submit_form
  end

  step "I fill and submit form with not email data in 'Email' field" do
    self.user=build(:user)
    SignUpPage.
        given.fill_form(
        user_name: self.user.name ,
        email: "not_email_data",
        password: self.user.password,
        password_confirmation: self.user.password).submit_form
  end

  step "I fill and submit form with identical data less then 8 characters in 'Password' and 'Password confirmation' fields" do
    self.user=build(:user)
    SignUpPage.
        given.fill_form(
        user_name: self.user.name ,
        email: self.user.email,
        password: "1234567",
        password_confirmation: "1234567").submit_form
  end

  step "I fill and submit form with not identical data in 'Password' and 'Password confirmation' fields" do
    self.user=build(:user)
    SignUpPage.
        given.fill_form(
        user_name: self.user.name ,
        email: self.user.email,
        password: self.user.password,
        password_confirmation: "1234567").submit_form
  end

  step "I fill and submit form with email data which is already used by user in 'Email' field" do
    SignUpPage.
        given.fill_form(
        user_name: self.user.name ,
        email: self.user.email,
        password: self.user.password,
        password_confirmation: self.user.password).submit_form
  end

  # THEN
  step "I should be redirected to sign up page" do
   SignUpPage.given
  end

  step "I should not be logged to the system" do
    expect(HomePage).to_not be_authenticated
  end

  step "I should see info on home page that confirmation link has been sent to email address" do
    expect(HomePage.given.text).to include('A message with a confirmation link has been sent to your email address. Please open the link to activate your account.')
    end

  step "I should receive confirmation email" do
    ConfirmationInstructionEmail.
        find_by_recipient(self.user.email)
  end

  step "I should see info on login page that account was successfully confirmed" do
    expect(LoginPage.given.text).to include('Your account was successfully confirmed.')
  end

  step "I should be logged to the system" do
    expect(HomePage).to be_authenticated
  end

  step "I should see info on sign up page that email and password can't be blank" do
    expect(SignUpPage.given.text).to include('Email can\'t be blank')
    expect(SignUpPage.given.text).to include('Password can\'t be blank')
  end

  step "I should see info on sign up page that password can't be blank" do
    expect(SignUpPage.given.text).to include('Password can\'t be blank')
  end

  step "I should see info on sign up page that email can't be blank" do
    expect(SignUpPage.given.text).to include('Email can\'t be blank')
  end

  step "I should see info on sign up page that email data is incorrect" do
    SignUpPage.given
  end

  step "I should see info on sign up page that password is too short" do
    expect(SignUpPage.given.text).to include('Password is too short')
  end

  step "I should see info on sign up page that password confirmation doesn't match password" do
    expect(SignUpPage.given.text).to include('Password confirmation doesn\'t match Password')
  end

  step "I should see info on sign up page that email has already been taken" do
    expect(SignUpPage.given.text).to include('Email has already been taken')
  end
end

RSpec.configure { |c| c.include SignupSteps, signup_steps: true }