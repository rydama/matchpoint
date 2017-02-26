require "rails_helper"
require "support/features/clearance_helpers"

feature "Home page" do
  let(:tournament) { create(:tournament) }
  let(:past_tournament) { create(:tournament, start_at: 3.days.ago, end_at: 2.days.ago) }
  let(:user) { create(:user) }

  scenario "shows the user's email" do
    visit home_path(as: user)
    expect(page).to have_content(user.email)
  end

  scenario "shows registered tournaments" do
    create(:registration, user: user, tournament: tournament)
    visit home_path(as: user)
    expect(page).to have_content("Tournaments I'm Playing In")
    expect(page).to have_link(tournament.name)
  end

  scenario "shows owned tournaments" do
    tournament = create(:tournament, owner: user)
    visit home_path(as: user)
    expect(page).to have_content("Tournaments I'm Hosting")
    expect(page).to have_link(tournament.name)
  end
end
