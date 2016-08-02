module ResetPasswordSteps

  attr_accessor :new_user
  # GIVEN

  # WHEN

  step 'I click forgot password link on login page' do
    LoginPage.open
    LoginPage.on { navigate_to_forgot_password_page }
  end

  step 'I fill and submit form on forgot password page with correct email data' do
    user = self.user
    ForgotPasswordPage.on do
      fill_form(email: user.email)
      submit_form
    end
  end

  step 'I fill and submit form on change password page with correct data' do
    self.new_user = build(:user)
    new_user = self.new_user
    ChangePasswordPage.on do
      fill_form(new_password: new_user.password,
                confirm_new_password: new_user.password)
      submit_form
    end
  end

  step 'I fill and submit form on change password page with not identical data' do
    ChangePasswordPage.on do
      fill_form(new_password: 1234567890,
                confirm_new_password: 1234567)
      submit_form
    end
  end

  step 'I fill and submit form on change password page with identical data less then 8 characters' do
    ChangePasswordPage.on do
      fill_form(new_password: 1234567,
                confirm_new_password: 1234567)
      submit_form
    end
  end

  step 'I receive and confirm resetting password from confirmation email' do
    ResetPasswordConfirmationEmail.find_by_recipient(self.user.email).confirm_my_account
  end

  step 'I fill and submit form on forgot password page with blank email field' do
    ForgotPasswordPage.on do
      fill_form(email: '')
      submit_form
    end
  end

  step 'I fill and submit form on forgot password page with not existent email' do
    self.new_user = build(:user)
    new_user = self.new_user
    ForgotPasswordPage.on do
      fill_form(email: new_user.email)
      submit_form
    end
  end

  step 'I fill and submit form on forgot password page with not email data' do
    ForgotPasswordPage.on do
      fill_form(email: "test.1234567890")
      submit_form
    end
  end

  # THEN

  step 'I should see following text on change password page:' do |text|
    expect(ChangePasswordPage.given.text).to include(text)
  end

  step 'I should see following text on forgot password page:' do |text|
    expect(ForgotPasswordPage.given.text).to include(text)
  end

  step 'forgot password page should be displayed' do
    expect(ForgotPasswordPage).to be_displayed
  end

end

RSpec.configure { |c| c.include ResetPasswordSteps, reset_password_steps: true }
