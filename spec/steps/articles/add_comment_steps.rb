module AddCommentSteps

  attr_accessor :comment

  # GIVEN

  step 'I am on an article page' do
    ArticlePage.open(id: self.article.id)
  end

  # WHEN

  step 'I fill and submit new comment form on article page' do
    s = self
    self.comment = build(:comment)
    ArticlePage.on do
      fill_comment_form(body: s.comment.body)
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
    s = self
    ArticlePage.on { expect(text).to include(s.comment.body) }
  end

end

RSpec.configure { |c| c.include AddCommentSteps, add_comment_steps: true }
