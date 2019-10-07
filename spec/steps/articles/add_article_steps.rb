module AddArticleSteps
  attr_accessor :article

  # GIVEN

  # WHEN

  step 'I click new article button on article list page' do
    ArticleListPage.on { add_new_article }
  end

  step 'I fill and submit form on new article page with correct data' do
    s = self
    self.article = build(:article)
    NewArticlePage.on do
      fill_form(title: s.article.title, text: s.article.text)
      submit_form
    end
  end

  step 'I fill and submit form on new article page with blank data' do
    NewArticlePage.on do
      fill_form
      submit_form
    end
  end

  step "I fill and submit form on new article page with data less than 5 characters in 'Title' field" do
    self.article = build(:article)
    article_text = article.text
    NewArticlePage.on do
      fill_form(title: '1234', text: article_text)
      submit_form
    end
  end

  # THEN

  step 'I should see newly created article with correct data on article page' do
    article_title = article.title
    article_text = article.text
    ArticlePage.on do
      expect(text).to include(article_title.upcase)
      expect(text).to include(article_text)
    end
  end

  step 'I should see newly created article with correct data on article list page' do
    article_title = article.title
    article_text = article.text
    ArticleListPage.on do
      expect(text).to include(article_title.upcase)
      expect(text).to include(article_text)
    end
  end

  step 'I should see following text on new article page:' do |text|
    expect(NewArticlePage.given.text.gsub("\n", ' ').downcase).to include(text.downcase)
  end
end

RSpec.configure { |c| c.include AddArticleSteps, add_article_steps: true }
