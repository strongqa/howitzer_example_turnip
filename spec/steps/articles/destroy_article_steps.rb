module DestroyArticleteps

  # GIVEN

  # WHEN

  step "I click destroy button and confirm action" do
    ArticleListPage.given.destroy_article(self.article.title, true)
  end

  # THEN

  step "I should not see article on articles list page" do
    expect(ArticleListPage.given.text).to_not include(self.article.title)
  end

end

RSpec.configure { |c| c.include DestroyArticleteps, destroy_article_steps: true }