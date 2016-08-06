module UsersListSteps
  # GIVEN

  # WHEN

  # THEN
  step "I should see user's email signed up on today's date" do
    s = self
    UsersPage.on { expect(user_registration_date(s.user.email)).to include Date.current.to_s(:db) }
  end
end

RSpec.configure { |c| c.include UsersListSteps, users_list_steps: true }
