module ResetPasswordSteps
  attr_accessor :new_user
  # GIVEN

  # WHEN

  step 'I click forgot password link on login page' do
    LoginPage.open
    LoginPage.on { navigate_to_forgot_password_page }
  end

  step 'I fill and submit form on forgot password page with correct email data' do
    s = self
    ForgotPasswordPage.on do
      fill_form(email: s.user.email)
      submit_form
    end
  end

  step 'I fill and submit form on change password page with correct data' do
    s = self
    self.new_user = build(:user)
    ChangePasswordPage.on do
      fill_form(new_password: s.new_user.password,
                confirm_new_password: s.new_user.password)
      submit_form
    end
  end

  step 'I fill and submit form on change password page with not identical data' do
    ChangePasswordPage.on do
      fill_form(new_password: 1_234_567_890,
                confirm_new_password: 1_234_567)
      submit_form
    end
  end

  step 'I fill and submit form on change password page with identical data less than 8 characters' do
    ChangePasswordPage.on do
      fill_form(new_password: 1_234_567,
                confirm_new_password: 1_234_567)
      submit_form
    end
  end

  step 'I receive and confirm resetting password from confirmation email' do
    ResetPasswordConfirmationEmail.find_by_recipient(user.email).reset_password
  end

  step 'I fill and submit form on forgot password page with blank email field' do
    ForgotPasswordPage.on do
      fill_form(email: '')
      submit_form
    end
  end

  step 'I fill and submit form on forgot password page with not existent email' do
    s = self
    self.new_user = build(:user)
    ForgotPasswordPage.on do
      fill_form(email: s.new_user.email)
      submit_form
    end
  end

  step 'I fill and submit form on forgot password page with not email data' do
    ForgotPasswordPage.on do
      fill_form(email: 'test.1234567890')
      submit_form
    end
  end

  # THEN

  step 'I should see following text on change password page:' do |text|
    expect(ChangePasswordPage.given.text.gsub("\n", ' ')).to include(text)
  end

  step 'I should see following text on forgot password page:' do |text|
    expect(ForgotPasswordPage.given.text.gsub("\n", ' ')).to include(text)
  end

  step 'forgot password page should be displayed' do
    expect(ForgotPasswordPage).to be_displayed
  end
end

RSpec.configure { |c| c.include ResetPasswordSteps, reset_password_steps: true }
