module Turnip::Steps

  attr_accessor :user, :user1, :user2, :article

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

  step "there is user in the system" do
    self.user = build(:user).save!
  end

  step "I am logged to the system as user" do
    LoginPage.open.login_as(self.user.email, self.user.password)
  end

  step "there is an article" do
    self.article = build(:article).save!
  end

  step "I am on articles list page" do
    ArticleListPage.open
  end

  step "I am on edit account page" do
    EditAccountPage.open
  end

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

  step "I open :page page" do |page|
    page.open
  end

  step "I click :item menu item" do |item|
    HomePage.given.choose_menu(item.capitalize)
  end

  step "I open articles list page" do
    ArticleListPage.open
  end

  # THEN

  step ":page page should be displayed" do |page|
    page.wait_for_opened
  end

  step "I should see following text on :page page:" do |page, text|
    expect(page.given.flash_message).to eql(text)
  end

  step "I should be redirected to :page page" do |page|
    page.given
  end

end