module EditAccountSteps

  attr_accessor :new_user
  # GIVEN

  # WHEN

  step 'I fill and submit form on edit account page with correct new data' do
    self.new_user = build(:user)
    user = self.user
    new_user = self.new_user
    EditAccountPage.on do
      fill_form(user_name: new_user.name,
                password: new_user.password,
                password_confirmation: new_user.password,
                current_password: user.password)
      submit_form
    end
  end

  step 'I fill form on login page with correct email and new password' do
    user = self.user
    new_user = self.new_user
    LoginPage.open
    LoginPage.on { login_as(user.email, new_user.password) }
  end

  step 'I open edit account page' do
    EditAccountPage.open
  end

  step 'I fill and submit form on edit account page with correct new email data' do
    user = self.user
    self.new_user = build(:user)
    new_user = self.new_user
    EditAccountPage.on do
      fill_form(user_name: user.name,
                email: new_user.email,
                password: user.password,
                password_confirmation: user.password,
                current_password: user.password)
      submit_form
    end
  end

  step 'I confirm new account from confirmation instruction email' do
    ConfirmationInstructionEmail.find_by_recipient(self.new_user.email).confirm_my_account
  end

  step 'I fill form on login page with correct new email and password' do
    user = self.user
    new_user = self.new_user
    LoginPage.open
    LoginPage.on do
      fill_form(email: new_user.email,
                password: user.password)
      submit_form
    end
  end

  step 'I fill and submit form on edit account page with incorrect email' do
    user = self.user
    EditAccountPage.on do
      fill_form(email: 'test@.ua',
                current_password: user.password)
      submit_form
    end
  end

  step "I fill and submit form on edit account page with user1 data in 'Email' field" do
    user1 = self.user1
    user2 = self.user2
    EditAccountPage.on do
      fill_form(email: user1.email,
                current_password: user2.password)
      submit_form
    end
  end

  step "I fill and submit form on edit account page with not correct password in 'Current password' field" do
    user = self.user
    EditAccountPage.on do
      fill_form(password: user.password,
                password_confirmation: user.password,
                current_password: 'incorrect_password')
      submit_form
    end
  end

  step "I fill and submit form on edit account page with not identical data in 'Password' and 'Passsword confirmation' fields" do
    user = self.user
    EditAccountPage.on do
      fill_form(password: '12345678',
                password_confirmation: '123456789',
                current_password: user.password)
      submit_form
    end
  end

  step "I fill and submit form on edit account page with data less then 8 characters in 'Password' and 'Passsword confirmation' fields" do
    user = self.user
    EditAccountPage.on do
      fill_form(password: '1234567',
                password_confirmation: '1234567',
                current_password: user.password)
      submit_form
    end
  end

  # THEN

  step 'I should see newly created data' do
    user = self.user
    new_user = self.new_user
    EditAccountPage.open
    EditAccountPage.on do
      expect(form_data).to eq({user_name: new_user.name,
                               email: user.email,
                               password: '',
                               password_confirmation: '',
                               current_password: ''})
    end
  end

  step "edit account page should be displayed" do
    expect(EditAccountPage).to be_displayed
  end

  step "I should see following text on edit account page:" do |text|
    EditAccountPage.on { expect(errors_section.error_message).to eql(text) }
  end

end

RSpec.configure { |c| c.include EditAccountSteps, edit_account_steps: true }
