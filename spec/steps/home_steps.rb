module HomeSteps

  # GIVEN

  # WHEN

  # THEN

  step 'I should see today form on home page with correct article title' do
    article = self.article
    HomePage.on { expect(find_form_text('Today')).to include(article.title) }
  end

end

RSpec.configure { |c| c.include HomeSteps, home_steps: true }