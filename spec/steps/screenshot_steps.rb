module ScreenshotSteps
  # When

  step 'I navigate to home page' do
    HomePage.open
  end

  step 'I force making screenshot' do
    HomePage.on do
      Capybara::Screenshot.screenshot_and_save_page
    end
  end

  # Then

  step 'screenshot should be created and placed in log directory' do
    screenshot = File.join(File.dirname(__FILE__), '../../log/screenshot.png')
    expect(File.exist?(screenshot)).to be_truthy
  end
end

RSpec.configure { |c| c.include ScreenshotSteps, screenshot_steps: true }
