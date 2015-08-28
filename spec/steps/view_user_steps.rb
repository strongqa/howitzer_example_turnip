module ViewUserSteps
  attr_accessor :user1, :user2

  # GIVEN

  step "there is user1 in the system" do
    self.user1 = build(:user).save!
  end

  step "there is user2 in the system" do
    self.user2 = build(:user).save!
  end

  step "I am logged to the system as user2" do
    LoginPage.open.login_as(self.user2.email, self.user2.password)
  end

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