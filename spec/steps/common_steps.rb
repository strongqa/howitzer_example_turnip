# rubocop:disable Style/ClassAndModuleChildren
module Turnip::Steps
  # rubocop:enable Style/ClassAndModuleChildren
  attr_accessor :admin, :admin_user, :user, :user1, :user2, :article, :article1, :article2, :comment, :category

  # GIVEN

  step 'opened browser' do
    HomePage.open
  end

  step 'I am logged to the system as admin user' do
    admin = create(:user, :admin)
    LoginPage.open
    LoginPage.on do
      login_as(admin.email, admin.password)
    end
  end

  step 'I am logged to the system as existed admin user' do
    s = self
    LoginPage.open
    LoginPage.on { login_as(s.admin_user.email, s.admin_user.password) }
  end

  step 'I am on :page page', &:open

  step 'there is user in the system' do
    self.user = create(:user)
  end

  step 'I am logged to the system as user' do
    s = self
    LoginPage.open
    LoginPage.on { login_as(s.user.email, s.user.password) }
  end

  step 'there is an article' do
    @article = create(:article, category: create(:category, :default))
    Howitzer::Cache.store(:teardown, :article, @article.id)
  end

  step 'there is an article category' do
    @category = create(:category)
  end

  step 'there is an article1 with special category' do
    @article = create(:article, category: @category)
  end

  step 'there is an article2 with special category' do
    @article2 = create(:article, category: @category)
    Howitzer::Cache.store(:teardown, :category, @category.id)
  end

  step 'I am on articles list page' do
    ArticleListPage.open
  end

  step 'I am on edit account page' do
    EditAccountPage.open
  end

  step 'there is admin user in the system' do
    self.admin_user = create(:user, :admin)
  end

  step 'there is user1 in the system' do
    self.user1 = create(:user)
  end

  step 'there is user2 in the system' do
    self.user2 = create(:user)
  end

  step 'I am logged to the system as user2' do
    s = self
    LoginPage.open
    LoginPage.on { login_as(s.user2.email, s.user2.password) }
  end

  step 'I am on sign up page' do
    SignUpPage.open
  end

  step 'there is an article with created by admin user comment to this article' do
    @article = create(:article, category: create(:category, :default))
    Howitzer::Cache.store(:teardown, :article, @article.id)
    self.comment = create(:comment, article: article, user: create(:user, :admin))
  end

  # WHEN

  step 'I open :page page', &:open

  step 'I click :item menu item' do |item|
    HomePage.on { main_menu_section.choose_menu(item.capitalize) }
  end

  step 'I open articles list page' do
    ArticleListPage.open
  end

  step 'I open categories list page' do
    CategoriesListPage.open
  end

  step 'I log out on :page page' do |page|
    page.on { main_menu_section.choose_menu('Logout') }
  end

  step 'I fill and submit form on sign up page with correct data' do
    s = self
    self.user = build(:user)
    SignUpPage.on do
      fill_form(user_name: s.user.name,
                email: s.user.email,
                password: s.user.password,
                password_confirmation: s.user.password)
      submit_form
    end
  end

  step 'I fill and submit form on login page with correct data' do
    s = self
    LoginPage.on do
      fill_form(email: s.user.email, password: s.user.password)
      submit_form
    end
  end

  step 'I click on cancel my account button on edit account page and confirm action' do
    EditAccountPage.on { cancel_my_account }
  end

  step 'I open this article page' do
    ArticlePage.open(id: article.id)
  end

  step 'I am trying to navigate to users page' do
    UsersPage.open(validate: false)
  end

  # THEN

  step ':page page should be displayed' do |page|
    expect(page).to be_displayed
  end

  step 'I should see following text on :page page:' do |page, text|
    page.on { expect(sanitized_alert_text).to eql(text) }
  end

  step 'I should be redirected to :page page', &:given

  step 'I should not be logged to the system' do
    expect(HomePage).to be_not_authenticated
  end

  step 'I should be logged to the system' do
    expect(HomePage).to be_authenticated
  end
end
