module LoginSteps

  # GIVEN

  # step 'I am on login page' do
  #   LoginPage.open
  # end

  # WHEN

  step "I fill and submit form on login page with check 'Remember me' checkbox" do
    LoginPage.given.fill_form(email: self.user.email, password: self.user.password, remember_me: 'yes').submit_form
  end

  step "I submit form on login page" do
    LoginPage.given.submit_form
  end

  step "I fill and submit form on login page with blank password field" do
    LoginPage.given.fill_form(email: self.user.email, password: '').submit_form
  end

  step "I fill and submit form on login page with blank email field" do
    LoginPage.given.fill_form(email: '', password: self.user.password).submit_form
  end

  step "I fill and submit form on login page with blank all fields" do
    LoginPage.given.fill_form(email: '', password: '').submit_form
  end

  step "I fill and submit form on login page with incorrect password data" do
    LoginPage.given.fill_form(email: self.user.email, password: 'incorrect_password').submit_form
  end

  step "I fill and submit form on login page with incorrect email data" do
    LoginPage.given.fill_form(email: 'incorrect@example.com', password: self.user.password).submit_form
  end

  step "I fill and submit form on login page with incorrect password and email data" do
    LoginPage.given.fill_form(email: 'incorrect@example.com', password: 'incorrect_password').submit_form
  end

  step "I come back next time" do
    step "I am on home page"
  end

  # THEN

  step "I should see user's email in email field and filled password field on login form" do
    expect(page).to have_text self.user.email
    expect(page).to have_text self.user.password
  end

  step "I close my browser" do
    page.execute_script "window.close();"
  end

end

RSpec.configure { |c| c.include LoginSteps, login_steps: true }