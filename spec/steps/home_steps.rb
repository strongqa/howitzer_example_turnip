module HomeSteps
  # GIVEN

  # WHEN
  step 'I open quick start on howitzer frame' do
    HomePage.on do
      wait_for { has_howitzer_home_iframe? }
      howitzer_home_iframe do |frame|
        frame.open_quick_start
      end
    end
  end

  # THEN

  step 'I should see today form on home page with correct article title' do
    s = self
    HomePage.on { expect(find_article_group_text(1)).to include(s.article.title.upcase) }
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
