module EditAccountSteps
  attr_accessor :new_user

  # GIVEN

  # WHEN

  step 'I fill and submit form on edit account page with correct new data' do
    s = self
    self.new_user = build(:user)
    EditAccountPage.on do
      fill_form(
        user_name: s.new_user.name,
        email: s.user.email,
        password: s.new_user.password,
        password_confirmation: s.new_user.password,
        current_password: s.user.password
      )
      submit_form
    end
  end

  step 'I fill form on login page with correct email and new password' do
    s = self
    LoginPage.open
    LoginPage.on { login_as(s.user.email, s.new_user.password) }
  end

  step 'I open edit account page' do
    EditAccountPage.open
  end

  step 'I fill and submit form on edit account page with correct new email data' do
    s = self
    self.new_user = build(:user)
    EditAccountPage.on do
      fill_form(
        user_name: s.user.name,
        email: s.new_user.email,
        password: s.user.password,
        password_confirmation: s.user.password,
        current_password: s.user.password
      )
      submit_form
    end
  end

  step 'I confirm new account from confirmation instruction email' do
    ConfirmationInstructionEmail.find_by_recipient(new_user.email).confirm_my_account
  end

  step 'I fill form on login page with correct new email and password' do
    s = self
    LoginPage.open
    LoginPage.on do
      fill_form(
        email: s.new_user.email,
        password: s.user.password
      )
      submit_form
    end
  end

  step 'I fill and submit form on edit account page with incorrect email' do
    s = self
    EditAccountPage.on do
      fill_form(
        user_name: s.user.name,
        email: 'test@.ua',
        current_password: s.user.password
      )
      submit_form
    end
  end

  step "I fill and submit form on edit account page with user1 data in 'Email' field" do
    s = self
    EditAccountPage.on do
      fill_form(
        user_name: s.user1.name,
        email: s.user1.email,
        current_password: s.user2.password
      )
      submit_form
    end
  end

  step "I fill and submit form on edit account page with not correct password in 'Current password' field" do
    s = self
    EditAccountPage.on do
      fill_form(
        user_name: s.user.name,
        email: s.user.email,
        password: s.user.password,
        password_confirmation: s.user.password,
        current_password: 'incorrect_password'
      )
      submit_form
    end
  end

  step "I fill and submit form on edit account page with different 'Password' and 'Passsword confirmation' fields" do
    s = self
    EditAccountPage.on do
      fill_form(
        user_name: s.user.name,
        email: s.user.email,
        password: '12345678',
        password_confirmation: '123456789',
        current_password: s.user.password
      )
      submit_form
    end
  end

  step 'I fill and submit form on edit account page less than 8 chars ' \
       "in 'Password' and 'Passsword confirmation' fields" do
    s = self
    EditAccountPage.on do
      fill_form(
        user_name: s.user.name,
        email: s.user.email,
        password: '1234567',
        password_confirmation: '1234567',
        current_password: s.user.password
      )
      submit_form
    end
  end

  # THEN

  step 'I should see newly created data' do
    s = self
    EditAccountPage.open
    EditAccountPage.on do
      expect(form_data).to eq(user_name: s.new_user.name,
                              email: s.user.email,
                              password: '',
                              password_confirmation: '',
                              current_password: '')
    end
  end

  step 'edit account page should be displayed' do
    expect(EditAccountPage).to be_displayed
  end

  step 'I should see following text on edit account page:' do |text|
    EditAccountPage.on { expect(errors_section.error_message).to eql(text) }
  end
end

RSpec.configure { |c| c.include EditAccountSteps, edit_account_steps: true }
