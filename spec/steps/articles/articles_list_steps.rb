module ArticlesListSteps

  # GIVEN

  # WHEN

  # THEN

  step "I should see article in articles list page with correct article parameters" do
    expect(ArticleListPage.given.text).to include(self.article.title)
    expect(ArticleListPage.given.text).to include(self.article.text)
  end

end

RSpec.configure { |c| c.include ArticlesListSteps, articles_list_steps: true }