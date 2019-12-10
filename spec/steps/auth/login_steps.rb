module LoginSteps
  # WHEN

  step "I fill and submit form on login page with check 'Remember me' checkbox" do
    s = self
    LoginPage.on do
      fill_form(email: s.user.email, password: s.user.password, remember_me: 'yes')
      submit_form
    end
  end

  step 'I submit form on login page' do
    LoginPage.on { submit_form }
  end

  step 'I fill and submit form on login page with blank password field' do
    s = self
    LoginPage.on do
      fill_form(email: s.user.email, password: '')
      submit_form
    end
  end

  step 'I fill and submit form on login page with blank email field' do
    s = self
    LoginPage.on do
      fill_form(email: '', password: s.user.password)
      submit_form
    end
  end

  step 'I fill and submit form on login page with blank all fields' do
    LoginPage.on do
      fill_form(email: '', password: '')
      submit_form
    end
  end

  step 'I fill and submit form on login page with incorrect password data' do
    s = self
    LoginPage.on do
      fill_form(email: s.user.email, password: 'incorrect_password')
      submit_form
    end
  end

  step 'I fill and submit form on login page with incorrect email data' do
    s = self
    LoginPage.on do
      fill_form(email: 'incorrect@example.com', password: s.user.password)
      submit_form
    end
  end

  step 'I fill and submit form on login page with incorrect password and email data' do
    LoginPage.on do
      fill_form(email: 'incorrect@example.com', password: 'incorrect_password')
      submit_form
    end
  end

  step 'I come back next time' do
    step 'I am on home page'
  end

  # THEN

  step "I should see user's email in email field and filled password field on login form" do
    expect(page).to have_text user.email
    expect(page).to have_text user.password
  end

  step 'I close my browser' do
    execute_script 'window.close();'
  end
end

RSpec.configure { |c| c.include LoginSteps, login_steps: true }
