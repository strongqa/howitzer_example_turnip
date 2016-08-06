module DestroyArticleteps
  # GIVEN

  # WHEN

  step 'I click destroy button and confirm action' do
    s = self
    ArticleListPage.on { destroy_article(s.article.title, true) }
  end

  # THEN

  step 'I should not see article on articles list page' do
    s = self
    ArticleListPage.on { expect(text).to_not include(s.article.title) }
  end
end

RSpec.configure { |c| c.include DestroyArticleteps, destroy_article_steps: true }
