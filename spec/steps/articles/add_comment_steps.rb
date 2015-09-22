module AddCommentSteps

  attr_accessor :comment

  # GIVEN

  step "I am on an article page" do
    ArticlePage.open(self.article.id)
  end

  # WHEN

  step "I fill and submit new comment form on article page" do
    self.comment = build(:comment)
    ArticlePage.given.fill_comment_form(body: self.comment.body)
    ArticlePage.given.submit_form
  end

  step "I submit new comment form on article page with blank data" do
    ArticlePage.given.fill_comment_form
    ArticlePage.given.submit_form
  end

  # THEN

  step "I should see created comment on article page" do
    expect(ArticlePage.given.text).to include(self.comment.body)
  end

end

RSpec.configure { |c| c.include AddCommentSteps, add_comment_steps: true }