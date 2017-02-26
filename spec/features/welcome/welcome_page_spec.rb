require "rails_helper"
require "support/features/clearance_helpers"

feature "Welcome page" do
  scenario "Visitor visits" do
    visit root_path

    expect(page).to have_content("Welcome")
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Sign Up")
  end
end
