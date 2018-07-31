module EditArticleSteps
  attr_accessor :article

  # GIVEN

  # WHEN

  step 'I click edit button on articles list page' do
    s = self
    ArticleListPage.on { edit_article(s.article.title) }
  end

  step 'I fill and submit form on edit article page with new correct data' do
    s = self
    self.article = build(:article)
    EditArticlePage.on do
      fill_form(title: s.article.title, text: s.article.text)
      submit_form
    end
  end

  step 'I fill and submit form on edit article page with blank data' do
    EditArticlePage.on do
      fill_form(title: '', text: '')
      submit_form
    end
  end

  step "I fill and submit form on edit article page with data less than 5 characters in 'Title' field" do
    s = self
    self.article = build(:article)
    EditArticlePage.on do
      fill_form(title: '1234', text: s.article.text)
      submit_form
    end
  end

  # THEN

  step 'I should see article with new data on article page' do
    s = self
    ArticlePage.on do
      expect(text).to include(s.article.title.upcase)
      expect(text).to include(s.article.text)
    end
  end

  step 'I should see following text on edit article page:' do |text|
    EditArticlePage.on { expect(article_errors_section.error_message.downcase).to eql(text.downcase) }
  end
end

RSpec.configure { |c| c.include EditArticleSteps, edit_article_steps: true }
