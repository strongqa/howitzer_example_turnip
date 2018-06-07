module ViewUserSteps
  # GIVEN

  # WHEN

  step 'I click on user1 name on users page' do
    s = self
    UsersPage.open
    UsersPage.on { open_user(s.user1.name) }
  end

  step 'I click on my name on users page' do
    s = self
    UsersPage.open
    UsersPage.on { open_user(s.admin_user.name) }
  end

  step 'I click on admin email on users page' do
    UsersPage.open
    UsersPage.on { open_user(Howitzer.app_test_user) }
  end

  # THEN

  step 'I should see user1 name on users page' do
    s = self
    UserViewPage.on { expect(text).to include(s.user1.name) }
  end

  step 'I should see my name on users page' do
    s = self
    UserViewPage.on { expect(text).to include(s.admin_user.name) }
  end

  step 'I should see admin email on users page' do
    UserViewPage.on { expect(text).to include(Howitzer.app_test_user) }
  end
end

RSpec.configure { |c| c.include ViewUserSteps, view_user_steps: true }
