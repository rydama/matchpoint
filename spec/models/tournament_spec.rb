require "rails_helper"

describe Tournament, type: :model do
  describe "#owned_by" do
    let(:user) { build_stubbed(:user) }

    context "when given the owner" do
      let(:tournament) { build_stubbed(:tournament, owner: user) }

      it "returns true" do
        expect(tournament.owned_by(user)).to be true
      end
    end

    context "when given a different user" do
      let(:tournament) { build_stubbed(:tournament, owner: build_stubbed(:user)) }

      it "returns false" do
        expect(tournament.owned_by(user)).to be false
      end
    end

    context "when given nil" do
      let(:tournament) { build_stubbed(:tournament, owner: build_stubbed(:user)) }

      it "returns false" do
        expect(tournament.owned_by(nil)).to be false
      end
    end
  end
end
