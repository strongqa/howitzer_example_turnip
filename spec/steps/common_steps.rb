module Turnip::Steps

  # GIVEN

  step "opened browser" do
    HomePage.open
  end

  step "I am logged to the system as admin user" do
    LoginPage.open.login_as(settings.def_test_user, settings.def_test_pass)
  end

  step "I am on :page page" do |page|
    page.open
  end

  # WHEN

  step "I open :page page" do |page|
    page.open
  end

  # THEN

  step ":page page should be displayed" do |page|
    page.wait_for_opened
  end

end