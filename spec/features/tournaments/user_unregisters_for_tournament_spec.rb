require "rails_helper"
require "support/features/clearance_helpers"

feature "User unregisters for a tournament" do
  let(:user) { create(:user) }
  let(:tournament) { create(:tournament, owner: create(:user)) }

  scenario "that they had previously registered for" do
    create(:registration, player: user, tournament: tournament)
    visit tournament_path(tournament, as: user)

    click_link "Unregister"
    expect(page).to have_content("Register")
  end
end
