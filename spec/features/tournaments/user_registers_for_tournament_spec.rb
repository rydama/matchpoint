require "rails_helper"
require "support/features/clearance_helpers"

feature "User registers for a tournament" do
  let(:user) { create(:user) }

  scenario "that the user created" do
    tournament = create(:tournament, owner: user)
    visit tournament_path(tournament, as: user)

    click_link "Register"
    expect(page).to have_content("Unregister")
  end

  scenario "that someone else created" do
    tournament = create(:tournament, owner: user)
    visit tournament_path(tournament, as: create(:user))

    click_link "Register"
    expect(page).to have_content("Unregister")
  end
end
