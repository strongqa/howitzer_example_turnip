module EditArticleSteps

  attr_accessor :article

  # GIVEN

  # WHEN

  step 'I click edit button on articles list page' do
    article = self.article
    ArticleListPage.on { edit_article(article.title) }
  end

  step 'I fill and submit form on edit article page with new correct data' do
    self.article = build(:article)
    article = self.article
    EditArticlePage.on do
      fill_form(title: article.title, text: article.text)
      submit_form
    end
  end

  step 'I fill and submit form on edit article page with blank data' do
    EditArticlePage.on do
      fill_form(title: '', text: '')
      submit_form
    end
  end

  step "I fill and submit form on edit article page with data less then 5 characters in 'Title' field" do
    self.article = build(:article)
    article = self.article
    EditArticlePage.on do
      fill_form(title: "1234", text: article.text)
      submit_form
    end
  end

  # THEN

  step 'I should see article with new data on article page' do
    article = self.article
    ArticlePage.on do
      expect(text).to include(article.title)
      expect(text).to include(article.text)
    end
  end

  step "I should see following text on edit article page:" do |text|
    EditArticlePage.on { expect(errors_section.error_message).to eql(text) }
  end

end

RSpec.configure { |c| c.include EditArticleSteps, edit_article_steps: true }
