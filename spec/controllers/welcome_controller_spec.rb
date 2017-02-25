require "rails_helper"

describe WelcomeController, type: :controller do
  describe "GET index" do
    context "when not signed in" do
      it "renders the index template" do
        get :index
        expect(response).to render_template "index"
      end
    end

    context "when signed in" do
      before { sign_in }

      it "redirects to the home page" do
        get :index
        expect(response).to redirect_to home_path
      end
    end
  end
end
