module HomeSteps
####################################
#              CHECKS              #
####################################

  step "I should see today form on home page with correct article title" do
    expect(HomePage.given.find_form_text('Today')).to include(self.article.title)
  end

end

RSpec.configure { |c| c.include HomeSteps }