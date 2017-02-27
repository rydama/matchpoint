# A service that generates matches for a tournament.
class MatchGeneratorService
  # Generate (and save model objects for) matches for the given tournament.
  # If there are existing matches for the tournament, they will be deleted.
  # Return the matches if successful, otherwise nil. 
  def generate_for(tournament)
    return [] unless tournament.players.any?

    matches = []
    players = tournament.players.to_a
    start_at = tournament.start_at
    home_player = players.shift
    away_player = players.shift

    tournament.transaction do
      tournament.matches.destroy_all

      while home_player
        match = tournament.matches.new(
          home_player: home_player,
          away_player: away_player,
          start_at: start_at)

        match.save!
        matches << match

        home_player = players.shift
        away_player = players.shift
        start_at += 3.hours # assume 3 hour match times for now
      end
    end

    matches

  rescue ActiveRecord::RecordInvalid
    nil
  end
end
