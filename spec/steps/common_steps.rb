module Turnip::Steps
  attr_accessor :user
  # GIVEN

  step "opened browser" do
    HomePage.open
  end

  step "I am logged to the system as admin user" do
    LoginPage.open.login_as(settings.def_test_user, settings.def_test_pass)
  end

  step "I am on :page page" do |page|
    page.open
  end

  step "there is registered user in the system" do
    self.user = build(:user).save!
  end

  step "I am logged to the system as user" do
    LoginPage.open.login_as(self.user.email, self.user.password)
  end

  # WHEN

  step "I open :page page" do |page|
    page.open
  end

  step "I click :item menu item" do |item|
    HomePage.given.choose_menu(item.capitalize)
  end

  # THEN

  step ":page page should be displayed" do |page|
    page.wait_for_opened
  end

  step "I should see following text on :page page:" do |page, text|
    expect(page.given.text).to include(text)
  end

  step "I should be redirected to :page page" do |page|
    page.given
  end

end