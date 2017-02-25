module TournamentsHelper
  def tournament_submit_label(tournament)
    if tournament.new_record?
      "Create Tournament"
    else
      "Save Tournament"
    end
  end
end
