class MatchGeneratorService
  class << self
    def generate_matches(tournament)
      matches = []
      players = tournament.players.all
      start_at = tournament.start_at
      home_player = players.pop
      away_player = player.pop

      tournament.transaction do
        while home_player
          match = tournament.matches.new(
            home_player: home_player,
            away_player: away_player,
            start_at: start_at)
          match.save!
          matches << match

          home_player = players.pop
          away_player = player.pop
          start_at += 3.hours # assume 3 hour match times for now
        end
      end

      matches

    rescue ActiveRecord::RecordInvalid
      nil
    end
  end
end
