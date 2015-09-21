module ViewUserSteps

  # GIVEN

  # WHEN

  step "I click on user1 email on users page" do
    UsersPage.open.open_user(self.user1.email)
  end

  step "I click on my email on users page" do
    UsersPage.open.open_user(self.user2.email)
  end

  step "I click on admin email on users page" do
    UsersPage.open.open_user(settings.def_test_user)
  end

  # THEN

  step "I should see user1 email on users page" do
    expect(UserViewPage.given.text).to include(self.user1.email)
  end

  step "I should see my email on users page" do
    expect(UserViewPage.given.text).to include(self.user2.email)
  end

  step "I should see admin email on users page" do
    expect(UserViewPage.given.text).to include(settings.def_test_user)
  end

end

RSpec.configure { |c| c.include ViewUserSteps, view_user_steps: true }