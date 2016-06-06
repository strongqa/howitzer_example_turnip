module ViewArticleSteps

  # GIVEN

  # WHEN

  step "I click back to articles link on article page" do
    ArticlePage.given.back_to_article_list
  end

  # THEN

  step "I should see correct article data on article page" do
    expect(ArticlePage.given.text).to include(self.article.title)
    expect(ArticlePage.given.text).to include(self.article.text)
  end

  step "I should see admin user comment on article page with correct comment and commenter data" do
    # byebug
    expect(ArticlePage.given.text).to include(self.comment.body)
    expect(ArticlePage.given.text).to include("admin@strongqa.com")
  end

  step "I should see add comment form on article page" do
    expect(ArticlePage.given).to have_comment_form_element
  end

  step "I should see body field on article page" do
    expect(ArticlePage.given).to have_comment_field_element
  end

  step "I should see buttons: edit article, destroy comment, create comment on article page" do
    expect(ArticlePage.given).to have_edit_article_button_element
    expect(ArticlePage.given).to have_add_comment_button_element
    expect(ArticlePage.given).to have_destroy_comment_element(self.comment.body)
  end

  step "I should be redirected to article list page" do
    ArticleListPage.given
  end

end

RSpec.configure { |c| c.include ViewArticleSteps, view_article_steps: true }
