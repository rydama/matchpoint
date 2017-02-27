require "rails_helper"

describe MatchGeneratorService do
  describe "#generate_for" do
    let(:tournament) { build_stubbed(:tournament) }
    let(:match) { build_stubbed(:match, tournament: tournament) }

    subject { MatchGeneratorService.new.generate_for(tournament) }

    before do
      allow(tournament).to receive_message_chain("matches.new").and_return match
    end

    context "when there are no players registered" do
      before { expect(match).to_not receive(:save!) }

      it "returns an empty array" do
        expect(subject).to eq []
      end
    end

    context "with players registered" do
      let(:player1) { build_stubbed(:user) }
      let(:player2) { build_stubbed(:user) }
      let(:player3) { build_stubbed(:user) }
      let(:players) { [player1, player2, player3] }

      before do
        allow(tournament).to receive(:players).and_return players
        expect(match).to receive(:save!).twice
        expect(tournament).to receive_message_chain("matches.destroy_all")
      end

      it "creates matches for the players" do
        expect(subject.count).to eq 2
      end
    end
  end
end
