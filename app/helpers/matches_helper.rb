module MatchesHelper
  def match_generation_label(tournament)
    if tournament.matches.any?
      "Regenerate Matches"
    else
      "Generate Matches"
    end
  end
end
