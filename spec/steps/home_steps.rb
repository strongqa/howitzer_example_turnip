module HomeSteps
  attr_accessor :article
  # GIVEN

  step "there is an article" do
    self.article = FactoryGirl.build(:article).save!
  end

  # WHEN

  # THEN

  step "I should see today form on home page with correct article title" do
    expect(HomePage.given.find_form_text('Today')).to include(self.article.title)
  end

end

RSpec.configure { |c| c.include HomeSteps, home_steps: true }