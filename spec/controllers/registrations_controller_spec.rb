require "rails_helper"

describe RegistrationsController, type: :controller do
  describe "POST" do
    context "when not signed in" do
      it "redirects to the sign in page" do
        post :create
        expect(response).to redirect_to sign_in_path
      end
    end

    context "when signed in" do
      let(:tournament) { create(:tournament) }
      before do
        sign_in
      end

      it "creates a registration and redirects home" do
        post :create, params: { tournament_id: tournament.id }
        expect(response).to redirect_to home_path
      end

      it "creates a registration and redirects to the given redirect_to param" do
        post :create, params: { tournament_id: tournament.id, redirect_to: tournament_path(tournament) }
        expect(response).to redirect_to tournament_path(tournament)
      end
    end
  end
end
