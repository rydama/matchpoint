require "rails_helper"
require "support/features/clearance_helpers"

feature "Home page" do
  let(:tournament) { create(:tournament) }
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

    expect(page).to_not have_content("Tournaments I'm Hosting")
    expect(page).to_not have_content("Upcoming Tournaments")
    expect(page).to_not have_content("Past Tournaments")
  end

  scenario "shows owned tournaments" do
    tournament = create(:tournament, owner: user)

    visit home_path(as: user)
    expect(page).to have_content("Tournaments I'm Hosting")
    expect(page).to have_link(tournament.name)

    expect(page).to_not have_content("Tournaments I'm Playing In")
    expect(page).to_not have_content("Upcoming Tournaments")
    expect(page).to_not have_content("Past Tournaments")
  end

  scenario "shows upcoming tournaments" do
    tournament = create(:tournament, owner: create(:user))

    visit home_path(as: user)
    expect(page).to have_content("Upcoming Tournaments")
    expect(page).to have_link(tournament.name)

    expect(page).to_not have_content("Tournaments I'm Playing In")
    expect(page).to_not have_content("Tournaments I'm Hosting")
    expect(page).to_not have_content("Past Tournaments")
  end

  scenario "shows past tournaments for an owner" do
    past_tournament = create(:tournament, owner: user, start_at: 3.days.ago, end_at: 2.days.ago)

    visit home_path(as: user)
    expect(page).to have_content("Past Tournaments")
    expect(page).to have_link(past_tournament.name)

    expect(page).to_not have_content("Tournaments I'm Playing In")
    expect(page).to_not have_content("Tournaments I'm Hosting")
    expect(page).to_not have_content("Upcoming Tournaments")
  end

  scenario "shows past tournaments for a player" do
    past_tournament = create(:tournament, start_at: 3.days.ago, end_at: 2.days.ago)
    create(:registration, user: user, tournament: past_tournament)

    visit home_path(as: user)
    expect(page).to have_content("Past Tournaments")
    expect(page).to have_link(past_tournament.name)

    expect(page).to_not have_content("Tournaments I'm Playing In")
    expect(page).to_not have_content("Tournaments I'm Hosting")
    expect(page).to_not have_content("Upcoming Tournaments")
  end
end
