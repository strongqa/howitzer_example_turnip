module AddCommentSteps

  attr_accessor :comment

  # GIVEN

  step 'I am on an article page' do
    ArticlePage.open(id: self.article.id)
  end

  # WHEN

  step 'I fill and submit new comment form on article page' do
    self.comment = build(:comment)
    comment = self.comment
    ArticlePage.on do
      fill_comment_form(body: comment.body)
      submit_form
    end
  end

  step 'I submit new comment form on article page with blank data' do
    ArticlePage.on do
      fill_comment_form
      submit_form
    end
  end

  # THEN

  step 'I should see created comment on article page' do
    comment = self.comment
    ArticlePage.on { expect(text).to include(comment.body) }
  end

end

RSpec.configure { |c| c.include AddCommentSteps, add_comment_steps: true }