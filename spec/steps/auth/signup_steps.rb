module SignupSteps
  attr_accessor :user

  # GIVEN

  # WHEN

  step 'I click sign up menu item on home page' do
    HomePage.on { main_menu_section.choose_menu('Sign up') }
  end

  step 'I confirm account from confirmation email' do
    ConfirmationInstructionEmail
      .find_by_recipient(user.email)
      .confirm_my_account
  end

  step 'I fill and submit form with blank all fields' do
    SignUpPage.on { submit_form }
  end

  step "I fill and submit form with blank 'Password' and 'Password confirmation' fields" do
    s = self
    self.user = build(:user)
    SignUpPage.on do
      fill_form(user_name: s.user.name,
                email: s.user.email,
                password: '',
                password_confirmation: '')
      submit_form
    end
  end

  step "I fill and submit form with blank 'Email' field" do
    s = self
    self.user = build(:user)
    SignUpPage.on do
      fill_form(user_name: s.user.name,
                email: '',
                password: s.user.password,
                password_confirmation: s.user.password)
      submit_form
    end
  end

  step "I fill and submit form with not email data in 'Email' field" do
    s = self
    self.user = build(:user)
    SignUpPage.on do
      fill_form(user_name: s.user.name,
                email: 'not_email_data',
                password: s.user.password,
                password_confirmation: s.user.password)
      submit_form
    end
  end

  step 'I fill and submit form with identical data less than 8 chars' /
       " in 'Password' and 'Password confirmation' fields" do
    s = self
    self.user = build(:user)
    SignUpPage.on do
      fill_form(user_name: s.user.name,
                email: s.user.email,
                password: '1234567',
                password_confirmation: '1234567')
      submit_form
    end
  end

  step "I fill and submit form with not identical data in 'Password' and 'Password confirmation' fields" do
    s = self
    self.user = build(:user)
    SignUpPage.on do
      fill_form(user_name: s.user.name,
                email: s.user.email,
                password: s.user.password,
                password_confirmation: '1234567')
      submit_form
    end
  end

  step "I fill and submit form with email data which is already used by user in 'Email' field" do
    s = self
    SignUpPage.on do
      fill_form(user_name: s.user.name,
                email: s.user.email,
                password: s.user.password,
                password_confirmation: s.user.password)
      submit_form
    end
  end

  # THEN

  step 'I should be redirected to sign up page' do
    SignUpPage.given
  end

  step 'I should see info on home page that confirmation link has been sent to email address' do
    HomePage.on do
      expect(text).to include(
        'A message with a confirmation link has been sent to your email address.' /
        ' Please open the link to activate your account.'
      )
    end
  end

  step 'I should receive confirmation email' do
    ConfirmationInstructionEmail
      .find_by_recipient(user.email)
  end

  step 'I should see info on login page that account was successfully confirmed' do
    LoginPage.on { expect(text).to include('Your account was successfully confirmed.') }
  end

  step "I should see info on sign up page that email and password can't be blank" do
    SignUpPage.on do
      expect(text).to include('Email can\'t be blank')
      expect(text).to include('Password can\'t be blank')
    end
  end

  step "I should see info on sign up page that password can't be blank" do
    SignUpPage.on { expect(text).to include('Password can\'t be blank') }
  end

  step "I should see info on sign up page that email can't be blank" do
    SignUpPage.on { expect(text).to include('Email can\'t be blank') }
  end

  step 'I should see info on sign up page that email data is incorrect' do
    SignUpPage.given
  end

  step 'I should see info on sign up page that password is too short' do
    SignUpPage.on { expect(text).to include('Password is too short') }
  end

  step "I should see info on sign up page that password confirmation doesn't match password" do
    SignUpPage.on { expect(text).to include('Password confirmation doesn\'t match Password') }
  end

  step 'I should see info on sign up page that email has already been taken' do
    SignUpPage.on { expect(text).to include('Email has already been taken') }
  end
end

RSpec.configure { |c| c.include SignupSteps, signup_steps: true }
