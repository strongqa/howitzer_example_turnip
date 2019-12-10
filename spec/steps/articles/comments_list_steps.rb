module CommentsListSteps
  attr_accessor :article, :comment1, :comment2
  # GIVEN

  step 'there is an article with created by user comments to this article' do
    # self.article = create(:article, category: create(:category, :default))
    @article = create(:article, category: create(:category, :default))
    Howitzer::Cache.store(:teardown, :article, @article.id)
    self.comment1 = create(:comment, article: @article, user: create(:user))
    self.comment2 = create(:comment, article: @article, user: create(:user))
  end

  # WHEN

  # THEN

  step "I should see comments to this article with user's email in 'Commenter' heads" do
    s = self
    ArticlePage.on do
      expect(text).to include(s.comment1.body)
      expect(text).to include(s.comment2.body)
      expect(text).to include(s.comment1.user.name)
      expect(text).to include(s.comment2.user.name)
    end
  end
end

RSpec.configure { |c| c.include CommentsListSteps, comments_list_steps: true }
