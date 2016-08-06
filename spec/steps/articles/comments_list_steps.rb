module CommentsListSteps
  attr_accessor :article, :comment1, :comment2
  # GIVEN

  step 'there is an article with created by user comments to this article' do
    self.article = create(:article)
    self.comment1 = article.comments.create(body: 'comment_1', user_id: user.id)
    self.comment2 = article.comments.create(body: 'comment_2', user_id: user.id)
  end

  # WHEN

  # THEN

  step "I should see comments to this article with user's email in 'Commenter' heads" do
    s = self
    ArticlePage.on do
      expect(text).to include(s.comment1.body)
      expect(text).to include(s.comment2.body)
      expect(text).to include(s.comment1.user.email)
      expect(text).to include(s.comment2.user.email)
    end
  end
end

RSpec.configure { |c| c.include CommentsListSteps, comments_list_steps: true }
