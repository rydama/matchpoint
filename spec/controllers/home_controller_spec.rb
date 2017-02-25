require "rails_helper"

describe HomeController, type: :controller do
  describe "GET index" do
    context "when not signed in" do
      it "redirects to the sign in page" do
        get :index
        expect(response).to redirect_to sign_in_path
      end
    end

    context "when signed in" do
      before { sign_in }

      it "renders the index template" do
        get :index
        expect(response).to render_template "index"
      end
    end
  end
end
