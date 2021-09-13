module ArticlesListSteps
  # GIVEN

  # WHEN

  step 'I click on article in recent post on article list page' do
    article_title = article.title
    ArticleListPage.on { open_recent_post(article_title) }
  end

  step 'I click on category in right sidebar on article list page' do
    category_name = category.name
    ArticleListPage.on { open_category_item(category_name) }
  end

  # THEN

  step 'I should see article in articles list page with correct article parameters' do
    article_title = article.title
    article_text = article.text
    ArticleListPage.on do
      expect(text).to include(article_title.upcase)
      expect(text).to include(article_text)
    end
  end

  step 'I search necessary article in right sidebar on article list page' do
    article_title = article.title
    ArticleListPage.on { search_article(article_title) }
  end

  step 'I should see article on search page' do
    article_title = article.title
    SearchPage.on { expect(self).to have_article_element(lambda_args(name: article_title)) }
  end

  step 'I should see created article in recent post on article list page' do
    article_title = article.title
    ArticleListPage.on { expect(self).to have_recent_post_element(lambda_args(name: article_title)) }
  end

  step 'I should see article parameters on article page' do
    article_title = article.title
    article_text = article.text
    ArticlePage.on do
      expect(text).to include(article_title.upcase)
      expect(text).to include(article_text)
    end
  end

  step 'I should see category of created articles in right sidebar on article list page' do
    category_name = category.name
    ArticleListPage.on { expect(self).to have_category_item_element(lambda_args(name: category_name)) }
  end

  step 'I should see two articles on categories page' do
    CategoriesPage.on do
      expect(self).to have_article_element(lambda_args(name: out(:@article).title))
      expect(self).to have_article_element(lambda_args(name: out(:@article2).title))
    end
  end
end

RSpec.configure { |c| c.include ArticlesListSteps, articles_list_steps: true, articles_filtering: true }
