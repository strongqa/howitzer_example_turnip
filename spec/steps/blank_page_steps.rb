module BlankPageSteps

  # GIVEN

  # WHEN

  step "I open web blank page" do
    Howitzer::Web::BlankPage.open
  end

  # THEN

  step "web blank page should be displayed" do
    Howitzer::Web::BlankPage.wait_for_opened
  end

end

RSpec.configure { |c| c.include BlankPageSteps, blank_page_steps: true }
