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
      before do
        sign_in
      end

      it "creates a registration" do
        post :create, params: { registration: { tournament_id: create(:tournament).id } }
        expect(response).to be_success
      end
    end
  end
end

