module DestroyCommentSteps

  # GIVEN

  # WHEN

  step 'I click destroy comment button and confirm action' do
    comment = self.comment
    ArticlePage.on { destroy_comment(comment.body, true) }
  end

  # THEN

  step 'I should not see comment on article page' do
    comment = self.comment
    ArticlePage.on { expect(text).to_not include(comment.body) }
  end

end

RSpec.configure { |c| c.include DestroyCommentSteps, destroy_comment_steps: true }