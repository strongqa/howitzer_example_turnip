module DestroyCommentSteps

  # GIVEN

  # WHEN

  step "I click destroy comment button and confirm action" do
    ArticlePage.given.destroy_comment(self.comment.body, true)
  end

  # THEN

  step "I should not see comment on article page" do
    expect(ArticlePage.given.text).to_not include(self.comment.body)
  end

end

RSpec.configure { |c| c.include DestroyCommentSteps, destroy_comment_steps: true }