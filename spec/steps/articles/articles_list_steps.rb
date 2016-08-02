module ArticlesListSteps

  # GIVEN

  # WHEN

  # THEN

  step 'I should see article in articles list page with correct article parameters' do
    s = self
    ArticleListPage.on do
      expect(text).to include(s.article.title)
      expect(text).to include(s.article.text)
    end
  end

end

RSpec.configure { |c| c.include ArticlesListSteps, articles_list_steps: true }
