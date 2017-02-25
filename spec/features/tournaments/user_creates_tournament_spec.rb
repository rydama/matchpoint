require "rails_helper"
require "support/features/clearance_helpers"

feature "User creates tournament" do
  scenario "With valid inputs" do
    sign_in

    visit new_tournament_path
    fill_in "tournament_name", with: "Portland Classic"
    fill_in "tournament_description", with: "Fun in Portland"
    fill_in "tournament_start_at", with: "03/10/2017 10:00 AM"
    fill_in "tournament_end_at", with: "03/10/2017 10:00 AM"

    click_button "Create Tournament"
    expect(page).to have_content("Your tournament was created")
    expect(page).to have_content("Portland Classic")
  end

  scenario "With invalid dates" do
    sign_in

    visit new_tournament_path
    fill_in "tournament_name", with: "Portland Classic"
    fill_in "tournament_description", with: "Fun in Portland"
    fill_in "tournament_start_at", with: "03/10/2017 10:00 AM"
    fill_in "tournament_end_at", with: "not a date"

    click_button "Create Tournament"
    expect(page).to have_content("There was a problem saving the tournament")
  end
end
