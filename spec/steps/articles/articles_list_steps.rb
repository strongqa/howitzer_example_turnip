module ArticlesListSteps

  # GIVEN

  # WHEN

  # THEN

  step 'I should see article in articles list page with correct article parameters' do
    article = self.article
    ArticleListPage.on do
      expect(text).to include(article.title)
      expect(text).to include(article.text)
    end
  end

end

RSpec.configure { |c| c.include ArticlesListSteps, articles_list_steps: true }