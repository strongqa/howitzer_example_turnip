module EditArticleSteps

  attr_accessor :article

  # GIVEN

  # WHEN

  step "I click edit button on articles list page" do
    ArticleListPage.given.edit_article(self.article.title)
  end

  step "I fill and submit form on edit article page with new correct data" do
    self.article = build(:article)
    EditArticlePage.given.fill_form(title: self.article.title, text: self.article.text).submit_form
  end

  step "I fill and submit form on edit article page with blank data" do
    EditArticlePage.given.fill_form(title: '', text: '').submit_form
  end

  step "I fill and submit form on edit article page with data less then 5 characters in 'Title' field" do
    self.article = build(:article)
    EditArticlePage.given.fill_form(title: "1234", text: self.article.text).submit_form
  end

  # THEN

  step "I should see article with new data on article page" do
    expect(ArticlePage.given.text).to include(self.article.title)
    expect(ArticlePage.given.text).to include(self.article.text)
  end

  step "I should see following text on edit article page:" do |text|
    expect(EditArticlePage.given.error_message).to eql(text)
  end

end

RSpec.configure { |c| c.include EditArticleSteps, edit_article_steps: true }