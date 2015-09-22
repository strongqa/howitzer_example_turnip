module CommentsListSteps

  attr_accessor :article,:comment
  # GIVEN

  step "there is an article with created by user comments to this article" do
    self.article = build(:article).save!
    self.comment = build(:comment, body: "test", user_id: self.user.id, article_id: self.article.id)
    # self.article.comments.create(body: "test 2", user_id: self.user.id)
    self.article.save
  end

  # WHEN

  step "I open this article page" do
    ArticlePage.open(self.article.id)
  end

  # THEN

  step "I should see comments to this article with user's email in 'Commenter' heads" do
    expect(ArticlePage.given.text).to include(self.comment.body)
    # expect(ArticlePage.given.text).to include(self.article.comments.find(2).body)
    # expect(ArticlePage.given.text).to include(self.article.title)
    # expect(ArticlePage.given.text).to include(self.article.text)
  end

end

RSpec.configure { |c| c.include CommentsListSteps, comments_list_steps: true }