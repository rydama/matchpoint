require "rails_helper"

describe MatchGeneratorService do
  describe "#generate_for" do
    let(:tournament) { build_stubbed(:tournament) }

    subject { MatchGeneratorService.new.generate_for(tournament) }

    context "when there are no players registered" do
      before { expect_any_instance_of(Match).to_not receive(:save!) }

      it "returns an empty array" do
        expect(subject).to eq []
      end
    end

    context "with 3 players registered" do
      let(:player1) { build_stubbed(:user) }
      let(:player2) { build_stubbed(:user) }
      let(:player3) { build_stubbed(:user) }
      let(:players) { [player1, player2, player3] }

      before do
        allow(tournament).to receive(:players).and_return players
        allow_any_instance_of(Match).to receive(:save!)
        expect(tournament).to receive_message_chain("matches.destroy_all")
      end

      it "creates matches for the players" do
        expect(subject.count).to eq 2
      end

      it "the 2nd match is a bye" do
        expect(subject[1].away_player).to be_nil
      end
    end
  end
end
