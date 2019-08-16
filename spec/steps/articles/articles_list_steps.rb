module ArticlesListSteps
  # GIVEN

  # WHEN

  step 'I click on article in recent post on article list page' do
    s = self
    ArticleListPage.on { open_recent_post(s.article.title) }
  end

  step 'I click on category in right sidebar on article list page' do
    s = self
    ArticleListPage.on { open_category_item(s.category.name) }
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

  step 'I should see category of created articles in right sidebar on article list page' do
    s = self
    ArticleListPage.on { is_expected.to have_category_item_element(s.category.name) }
  end

  step 'I should see two articles on categories page' do
    s = self
    CategoriesPage.on do
      is_expected.to have_article_element(s.article1.title)
      is_expected.to have_article_element(s.article2.title)
    end
  end
end

RSpec.configure { |c| c.include ArticlesListSteps, articles_list_steps: true, articles_filtering: true }
