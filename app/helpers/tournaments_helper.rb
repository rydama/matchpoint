module TournamentsHelper
  def tournament_submit_label(tournament)
    if tournament.new_record?
      "Create Tournament"
    else
      "Save Tournament"
    end
  end

  def tournament_date_label(tournament)
    "#{tournament.start_at.to_formatted_s(:long)} - #{tournament.end_at.to_formatted_s(:long)}"
  end
end
