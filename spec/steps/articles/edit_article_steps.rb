module EditArticleSteps
  attr_accessor :article_new

  # GIVEN

  # WHEN

  step 'I click edit button on articles list page' do
    article_title = article.title
    ArticleListPage.on { edit_article(article_title) }
  end

  step 'I fill and submit form on edit article page with new correct data' do
    s = self
    self.article_new = build(:article)
    EditArticlePage.on do
      fill_form(title: s.article_new.title, text: s.article_new.text)
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
    article_text = article.text
    EditArticlePage.on do
      fill_form(title: '1234', text: article_text)
      submit_form
    end
  end

  # THEN

  step 'I should see article with new data on article page' do
    article_title = article_new.title
    article_text = article_new.text
    ArticlePage.on do
      expect(text).to include(article_title.upcase)
      expect(text).to include(article_text)
    end
  end

  step 'I should see following text on edit article page:' do |text|
    EditArticlePage.on { expect(article_errors_section.error_message.downcase).to eql(text.downcase) }
  end
end

RSpec.configure { |c| c.include EditArticleSteps, edit_article_steps: true }
