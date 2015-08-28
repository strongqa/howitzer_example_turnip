module AddArticleSteps

  attr_accessor :article

  # GIVEN

  step "I am on articles list page" do
    ArticleListPage.open
  end

  # WHEN

  step "I click new article button on article list page" do
    ArticleListPage.given.add_new_article
  end

  step "I fill and submit form on new article page with correct data" do
    self.article = build(:article)
    NewArticlePage.given.fill_form(title: self.article.title, text: self.article.text).submit_form
  end

  step "I fill and submit form on new article page with blank data" do
    NewArticlePage.given.fill_form.submit_form
  end

  step "I fill and submit form on new article page with data less then 5 characters in 'Title' field" do
    self.article = build(:article)
    NewArticlePage.given.fill_form(title: "1234", text: self.article.text).submit_form
  end

  # THEN

  step "I should see newly created article with correct data on article page" do
    expect(ArticlePage.given.text).to include(self.article.title)
    expect(ArticlePage.given.text).to include(self.article.text)
  end

  step "I should see newly created article with correct data on article list page" do
    expect(ArticleListPage.given.text).to include(self.article.title)
    expect(ArticleListPage.given.text).to include(self.article.text)
  end

  step "I should see following text on new article page:" do |text|
    expect(NewArticlePage.given.text).to include(text)
  end

end

RSpec.configure { |c| c.include AddArticleSteps, add_article_steps: true }