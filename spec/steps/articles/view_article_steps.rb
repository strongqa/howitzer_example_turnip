module ViewArticleSteps
  # GIVEN

  # WHEN

  step 'I click back to articles link on article page' do
    ArticlePage.on { back_to_article_list }
  end

  # THEN

  step 'I should see correct article data on article page' do
    article_title = article.title
    article_text = article.text
    ArticlePage.on do
      expect(text).to include(article_title.upcase)
      expect(text).to include(article_text)
    end
  end

  step 'I should see admin user comment on article page with correct comment and commenter data' do
    s = self
    ArticlePage.on do
      expect(text).to include(s.comment.body)
      expect(text).to include(s.comment.user.name)
    end
  end

  step 'I should see add comment form on article page' do
    ArticlePage.on { expect(self).to have_comment_form_element }
  end

  step 'I should see body field on article page' do
    ArticlePage.on { expect(self).to have_comment_field_element }
  end

  step 'I should see buttons: edit article, destroy comment, create comment on article page' do
    s = self
    ArticlePage.on do
      expect(self).to have_edit_article_button_element
      expect(self).to have_add_comment_button_element
      expect(self).to have_destroy_comment_element(lambda_args(name: s.comment.body))
    end
  end

  step 'I should be redirected to article list page' do
    ArticleListPage.given
  end
end

RSpec.configure { |c| c.include ViewArticleSteps, view_article_steps: true }
