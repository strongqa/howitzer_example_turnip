module ViewUserSteps

  # GIVEN

  # WHEN

  step 'I click on user1 email on users page' do
    user1 = self.user1
    UsersPage.open
    UsersPage.on { open_user(user1.email) }
  end

  step 'I click on my email on users page' do
    user2 = self.user2
    UsersPage.open
    UsersPage.on { open_user(user2.email) }
  end

  step 'I click on admin email on users page' do
    UsersPage.open
    UsersPage.on { open_user(settings.def_test_user) }
  end

  # THEN

  step 'I should see user1 email on users page' do
    user1 = self.user1
    UserViewPage.on { expect(text).to include(user1.email) }
  end

  step 'I should see my email on users page' do
    user2 = self.user2
    UserViewPage.on { expect(text).to include(user2.email) }
  end

  step 'I should see admin email on users page' do
    UserViewPage.on { expect(text).to include(settings.def_test_user) }
  end

end

RSpec.configure { |c| c.include ViewUserSteps, view_user_steps: true }