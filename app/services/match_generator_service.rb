# A service that generates round-robin matches for a tournament.
class MatchGeneratorService
  # Generate (and save Match objects for) matches for the given tournament.
  # If there are existing matches for the tournament, they will be deleted.
  # Return the matches if successful, otherwise nil. 
  def generate_for(tournament)
    return [] unless tournament.players.count > 1

    matches = []
    start_at = tournament.start_at

    tournament.transaction do
      tournament.matches.destroy_all

      round_robin_pairings(tournament).values.each do |pair|
        match = Match.new(
          tournament: tournament,
          home_player: pair[:home_player],
          away_player: pair[:away_player],
          start_at: start_at)

        match.save!
        matches << match
        start_at += 3.hours # assume 3-hour match times for now
      end
    end

    matches

  rescue ActiveRecord::RecordInvalid
    nil
  end

  private

  # Return a Hash of pairs representing the round-robin (each player plays all other players)
  # for the given tournament. Each pair is a hash containing two keys, :home_player and :away_player.
  def round_robin_pairings(tournament)
    pairs = {}
    players = tournament.players.to_a

    players.each do |player|
      other_players(player, players).each do |opponent|
        pairs[key_for(player, opponent)] ||= { home_player: player, away_player: opponent }
      end
    end

    pairs
  end

  def other_players(except_player, players)
    players - Array(except_player)
  end

  # Make a hash key to store the players in a pair. The key prevents the players from playing
  # each other more than once. The key is the player ids in order of lowest
  # to highest.
  def key_for(player1, player2)
    if player1.id < player2.id
      "#{player1.id}/#{player2.id}"
    else
      "#{player2.id}/#{player1.id}"
    end
  end
end
