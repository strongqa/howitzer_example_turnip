module DestroyArticleteps

  # GIVEN

  # WHEN

  step 'I click destroy button and confirm action' do
    article = self.article
    ArticleListPage.on { destroy_article(article.title, true) }
  end

  # THEN

  step 'I should not see article on articles list page' do
    article = self.article
    ArticleListPage.on { expect(text).to_not include(article.title) }
  end

end

RSpec.configure { |c| c.include DestroyArticleteps, destroy_article_steps: true }