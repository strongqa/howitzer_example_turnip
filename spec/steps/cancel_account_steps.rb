module CancelAccountSteps

  # GIVEN

  step "I am on edit account page" do
    EditAccountPage.open
  end

  # WHEN

  step"I click on cancel my account button on edit account page and confirm action" do
    EditAccountPage.given.cancel_my_account
  end

  # THEN

end

RSpec.configure { |c| c.include CancelAccountSteps, cancel_account_steps: true }