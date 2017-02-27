require "rails_helper"

describe MatchGeneratorService do
  describe "#generate_for" do
    let(:tournament) { build_stubbed(:tournament) }
    let(:player1) { build_stubbed(:user) }
    let(:player2) { build_stubbed(:user) }
    let(:player3) { build_stubbed(:user) }
    let(:player4) { build_stubbed(:user) }
    let(:matches) { MatchGeneratorService.new.generate_for(tournament) }

    context "no players" do
      before { expect_any_instance_of(Match).to_not receive(:save!) }

      it "returns an empty array" do
        expect(matches).to eq []
      end
    end

    context "1 player" do
      before do
        expect_any_instance_of(Match).to_not receive(:save!)
        allow(tournament).to receive(:players).and_return [player1]
      end

      it "returns an empty array" do
        expect(matches).to eq []
      end
    end

    context "2 players" do
      let(:players) { [player1, player2] }

      before do
        allow(tournament).to receive(:players).and_return players
        allow_any_instance_of(Match).to receive(:save!)
        expect(tournament).to receive_message_chain("matches.destroy_all")
      end

      it "creates 1 match" do
        expect(matches.count).to eq 1
      end
    end

    context "3 players" do
      before do
        allow(tournament).to receive(:players).and_return [player1, player2, player3]
        allow_any_instance_of(Match).to receive(:save!)
        expect(tournament).to receive_message_chain("matches.destroy_all")
      end

      it "creates 3 matches" do
        expect(matches.count).to eq 3
      end

      it "has match for player1 vs player2" do
        expect(matches.first.home_player).to eq player1
        expect(matches.first.away_player).to eq player2
      end

      it "has match for player1 vs player3" do
        expect(matches.second.home_player).to eq player1
        expect(matches.second.away_player).to eq player3
      end

      it "has match for player2 vs player3" do
        expect(matches.third.home_player).to eq player2
        expect(matches.third.away_player).to eq player3
      end
    end

    context "4 players" do
      before do
        allow(tournament).to receive(:players).and_return [player1, player2, player3, player4]
        allow_any_instance_of(Match).to receive(:save!)
        expect(tournament).to receive_message_chain("matches.destroy_all")
      end

      it "creates 3 matches" do
        expect(matches.count).to eq 6
      end

      it "has match for player1 vs player2" do
        expect(matches.first.home_player).to eq player1
        expect(matches.first.away_player).to eq player2
      end

      it "has match for player1 vs player3" do
        expect(matches.second.home_player).to eq player1
        expect(matches.second.away_player).to eq player3
      end

      it "has match for player1 vs player4" do
        expect(matches.third.home_player).to eq player1
        expect(matches.third.away_player).to eq player4
      end

      it "has match for player2 vs player3" do
        expect(matches.fourth.home_player).to eq player2
        expect(matches.fourth.away_player).to eq player3
      end

      it "has match for player2 vs player4" do
        expect(matches.fifth.home_player).to eq player2
        expect(matches.fifth.away_player).to eq player4
      end

      it "has match for player3 vs player4" do
        expect(matches[5].home_player).to eq player3
        expect(matches[5].away_player).to eq player4
      end
    end
  end
end
