module AddArticleSteps

  attr_accessor :article

  # GIVEN

  # WHEN

  step 'I click new article button on article list page' do
    ArticleListPage.on { add_new_article }
  end

  step 'I fill and submit form on new article page with correct data' do
    self.article = build(:article)
    article = self.article
    NewArticlePage.on do
      fill_form(title: article.title, text: article.text)
      submit_form
    end
  end

  step 'I fill and submit form on new article page with blank data' do
    NewArticlePage.on do
      fill_form
      submit_form
    end
  end

  step "I fill and submit form on new article page with data less then 5 characters in 'Title' field" do
    self.article = build(:article)
    article = self.article
    NewArticlePage.on do
      fill_form(title: "1234", text: article.text)
      submit_form
    end
  end

  # THEN

  step 'I should see newly created article with correct data on article page' do
    article = self.article
    ArticlePage.on do
      expect(text).to include(article.title)
      expect(text).to include(article.text)
    end
  end

  step 'I should see newly created article with correct data on article list page' do
    article = self.article
    ArticleListPage.on do
      expect(text).to include(article.title)
      expect(text).to include(article.text)
    end
  end

  step 'I should see following text on new article page:' do |text|
    expect(NewArticlePage.given.text).to include(text)
  end

end

RSpec.configure { |c| c.include AddArticleSteps, add_article_steps: true }