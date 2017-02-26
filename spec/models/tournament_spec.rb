require "rails_helper"

describe Tournament, type: :model do
  describe "#owned_by?" do
    let(:user) { build_stubbed(:user) }

    context "when given the owner" do
      let(:tournament) { build_stubbed(:tournament, owner: user) }

      it "returns true" do
        expect(tournament.owned_by?(user)).to be true
      end
    end

    context "when given a different user" do
      let(:tournament) { build_stubbed(:tournament, owner: build_stubbed(:user)) }

      it "returns false" do
        expect(tournament.owned_by?(user)).to be false
      end
    end

    context "when given nil" do
      let(:tournament) { build_stubbed(:tournament, owner: build_stubbed(:user)) }

      it "returns false" do
        expect(tournament.owned_by?(nil)).to be false
      end
    end
  end

  describe "validates date order" do
    context "when start is earlier than end" do
      let(:tournament) { build_stubbed(:tournament) }

      it "has no errors" do
        expect(tournament.errors).to be_empty
      end
    end

    context "when start is later than end" do
      let(:tournament) { build_stubbed(:tournament, start_at: 2.days.from_now, end_at: 1.day.from_now) }

      it "has an error" do
        expect(tournament.valid?).to be false
        expect(tournament.errors.full_messages.first).to eq "Start date must be earlier than end date"
      end
    end
  end
end
