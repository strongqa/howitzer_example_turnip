module EditAccountSteps

  attr_accessor :new_user
  # GIVEN

  # WHEN

  step "I fill and submit form on edit account page with correct new data" do
    self.new_user = build(:user)
    EditAccountPage.given.fill_form(user_name: self.new_user.name,
                                    password: self.new_user.password,
                                    password_confirmation: self.new_user.password,
                                    current_password: self.user.password).submit_form
  end

  step "I log out" do
    HomePage.given.choose_menu('Logout')
  end

  step "I fill form on login page with correct email and new password" do
    LoginPage.open.login_as(self.user.email, self.new_user.password)
  end

  step "I open edit account page" do
    EditAccountPage.open
  end

  step "I fill and submit form on edit account page with correct new email data" do
    self.new_user = build(:user)
    EditAccountPage.given.fill_form(user_name: self.user.name,
                                   email: self.new_user.email,
                                   password: self.user.password,
                                   password_confirmation: self.user.password,
                                   current_password: self.user.password).submit_form
  end

  step "I confirm new account from confirmation instruction email" do
    ConfirmationInstructionEmail.find_by_recipient(self.new_user.email).confirm_my_account
  end

  step "I fill form on login page with correct new email and password" do
    LoginPage.open.fill_form(email: self.new_user.email,
                             password: self.user.password).submit_form
  end

  step "I fill and submit form on edit account page with incorrect email" do
    EditAccountPage.given.fill_form(email: 'test@.ua',
                                   current_password: self.user.password).submit_form
  end

  step "I fill and submit form on edit account page with user1 data in 'Email' field" do
    EditAccountPage.given.fill_form(email: self.user1.email,
                                    current_password: self.user2.password).submit_form
  end

  step "I fill and submit form on edit account page with not correct password in 'Current password' field" do
    EditAccountPage.given.fill_form(password: self.user.password,
                                   password_confirmation: self.user.password,
                                   current_password: 'incorrect_password').submit_form
  end

  step "I fill and submit form on edit account page with not identical data in 'Password' and 'Passsword confirmation' fields" do
    EditAccountPage.given.fill_form(password: '12345678',
                                   password_confirmation: '123456789',
                                   current_password: self.user.password).submit_form
  end

  step "I fill and submit form on edit account page with data less then 8 characters in 'Password' and 'Passsword confirmation' fields" do
    EditAccountPage.given.fill_form(password: '1234567',
                                   password_confirmation: '1234567',
                                   current_password: self.user.password).submit_form
  end

  # THEN

  step "I should not be logged in the system" do
    expect(HomePage).to_not be_authenticated
  end

  step "I should be logged in the system" do
    expect(HomePage).to be_authenticated
  end

  step "I should see newly created data" do
    expect(EditAccountPage.open.form_data).to eq({user_name: self.new_user.name,
                                                  email: self.user.email,
                                                  password: '',
                                                  password_confirmation: '',
                                                  current_password: ''})
  end

  step "edit account page should be displayed" do
    EditAccountPage.wait_for_opened
  end

  step "I should see following text on edit account page:" do |text|
    expect(EditAccountPage.given.error_message).to eql(text)
  end

end

RSpec.configure { |c| c.include EditAccountSteps, edit_account_steps: true }