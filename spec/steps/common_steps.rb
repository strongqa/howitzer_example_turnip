module Turnip::Steps

  attr_accessor :user, :user1, :user2, :article, :comment

  # GIVEN

  step 'opened browser' do
    HomePage.open
  end

  step 'I am logged to the system as admin user' do
    LoginPage.open
    LoginPage.on { login_as(settings.def_test_user, settings.def_test_pass) }
  end

  step 'I am on :page page' do |page|
    page.open
  end

  step 'there is user in the system' do
    self.user = build(:user).save!
  end

  step 'I am logged to the system as user' do
    user = self.user
    LoginPage.open
    LoginPage.on { login_as(user.email, user.password) }
  end

  step 'there is an article' do
    self.article = build(:article).save!
  end

  step 'I am on articles list page' do
    ArticleListPage.open
  end

  step 'I am on edit account page' do
    EditAccountPage.open
  end

  step 'there is user1 in the system' do
    self.user1 = build(:user).save!
  end

  step 'there is user2 in the system' do
    self.user2 = build(:user).save!
  end

  step 'I am logged to the system as user2' do
    user2 = self.user2
    LoginPage.open
    LoginPage.on { login_as(user2.email, user2.password) }
  end

  step 'I am on sign up page' do
    SignUpPage.open
  end

  step 'there is an article with created by admin user comment to this article' do
    self.article = create(:article)
    self.comment = self.article.comments.create(body: "Some comment", user_id: User.where(email: settings.def_test_user).all.first.id)
  end

  # WHEN

  step 'I open :page page' do |page|
    page.open
  end

  step 'I click :item menu item' do |item|
    HomePage.on { main_menu_section.choose_menu(item.capitalize) }
  end

  step 'I open articles list page' do
    ArticleListPage.open
  end

  step 'I log out' do
    HomePage.on { main_menu_section.choose_menu('Logout') }
  end

  step 'I fill and submit form on sign up page with correct data' do
    self.user=build(:user)
    user = self.user
    SignUpPage.open
    SignUpPage.on do
      fill_form(user_name: user.name,
                email: user.email,
                password: user.password,
                password_confirmation: user.password)
      submit_form
    end
  end

  step 'I fill and submit form on login page with correct data' do
    user = self.user
    LoginPage.on do
      fill_form(email: user.email, password: user.password)
      submit_form
    end
  end

  step 'I click on cancel my account button on edit account page and confirm action' do
    EditAccountPage.on { cancel_my_account }
  end

  step 'I open this article page' do
    ArticlePage.open(id: self.article.id)
  end

  # THEN

  step ':page page should be displayed' do |page|
    expect(page).to be_displayed
  end

  step 'I should see following text on :page page:' do |page, text|
    expect(page.given.text).to include(text)
  end

  step 'I should be redirected to :page page' do |page|
    page.given
  end

  step 'I should not be logged to the system' do
    expect(HomePage).to be_not_authenticated
  end

  step 'I should be logged to the system' do
    expect(HomePage).to be_authenticated
  end

end
