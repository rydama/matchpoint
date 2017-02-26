require "rails_helper"

describe TournamentsHelper, type: :helper do
  describe "#tournament_submit_label" do
    let(:new_tournament) { build_stubbed(:tournament) }
    let(:existing_tournament) { build_stubbed(:tournament) }

    before { allow(new_tournament).to receive(:new_record?).and_return true }
    before { allow(existing_tournament).to receive(:new_record?).and_return false }

    it "returns something different for new and existing records" do
      expect(helper.tournament_submit_label(new_tournament))
        .to_not eq(helper.tournament_submit_label(existing_tournament))
    end
  end

  describe "#tournament_date_label" do
    let(:tournament) do
      build_stubbed(:tournament, start_at: "2017-01-01 10:00 AM", end_at: "2017-02-01 10:00 AM")
    end

    it "returns a label containing the start and end dates" do
      expect(helper.tournament_date_label(tournament)).to include "January"
      expect(helper.tournament_date_label(tournament)).to include "February"
    end
  end
end
