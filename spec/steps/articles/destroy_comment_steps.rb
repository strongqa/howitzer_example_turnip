module DestroyCommentSteps
  # GIVEN

  # WHEN

  step 'I click destroy comment button and confirm action' do
    s = self
    ArticlePage.on { destroy_comment(s.comment.body, confirmation: true) }
  end

  # THEN

  step 'I should not see comment on article page' do
    s = self
    ArticlePage.on { expect(text).not_to include(s.comment.body) }
  end
end

RSpec.configure { |c| c.include DestroyCommentSteps, destroy_comment_steps: true }
