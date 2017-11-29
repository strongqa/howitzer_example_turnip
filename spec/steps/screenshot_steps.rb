module ScreenshotSteps
  # When

  step 'I navigate to home page' do
    HomePage.open
  end

  step 'I force making screenshot and saving source page' do
    HomePage.on do
      Capybara::Screenshot.screenshot_and_save_page
    end
  end

  # Then

  step 'I should see screenshot in log directory' do
    screenshot = File.join(File.dirname(__FILE__), '../../log/screenshot.png')
    expect(File).to be_exist(screenshot)
  end

  step 'I should see source page in log directory' do
    source_page = File.join(File.dirname(__FILE__), '../../log/screenshot.html')
    expect(File).to be_exist(source_page)
  end
end

RSpec.configure { |c| c.include ScreenshotSteps, screenshot_steps: true }
