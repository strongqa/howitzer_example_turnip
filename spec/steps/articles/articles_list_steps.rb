module ArticlesListSteps
  # GIVEN

  # WHEN

  step 'I click on article in recent post on article list page' do
    s = self
    ArticleListPage.on { open_recent_post(s.article.title) }
  end

  # THEN

  step 'I should see article in articles list page with correct article parameters' do
    s = self
    ArticleListPage.on do
      expect(text).to include(s.article.title.upcase)
      expect(text).to include(s.article.text)
    end
  end

  step 'I search necessary article in right sidebar on article list page' do
    s = self
    ArticleListPage.on { search_article(s.article.title) }
  end

  step 'I should see article on search page' do
    s = self
    SearchPage.on { is_expected.to have_article_element(s.article.title) }
  end

  step 'I should see created article in recent post on article list page' do
    s = self
    ArticleListPage.on { is_expected.to have_recent_post_element(s.article.title) }
  end

  step 'I should see article parameters on article page' do
    s = self
    ArticlePage.on do
      expect(text).to include(s.article.title.upcase)
      expect(text).to include(s.article.text)
    end
  end
end

RSpec.configure { |c| c.include ArticlesListSteps, articles_list_steps: true }
