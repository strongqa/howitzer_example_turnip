module HomeSteps
  # GIVEN

  # WHEN
  step 'I open quick start on howitzer frame' do
    HomePage.on do
      howitzer_home_iframe(&:open_quick_start)
    end
  end

  # THEN

  step 'I should see today form on home page with correct article title' do
    s = self
    HomePage.on { expect(find_form_text('Today')).to include(s.article.title) }
  end

  step 'I should see install section on howitzer frame' do
    HomePage.on do
      howitzer_home_iframe do |frame|
        expect(frame).to have_install_section_element(visible: true)
      end
    end
  end
end

RSpec.configure { |c| c.include HomeSteps, home_steps: true }
