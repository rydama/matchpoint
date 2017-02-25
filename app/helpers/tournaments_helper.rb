module TournamentsHelper
  def tournament_submit_label(tournament)
    if tournament.new_record?
      "Create Tournament"
    else
      "Save Tournament"
    end
  end

  def tournament_date_label(tournament)
    "#{tournament.start_at.strftime('%B %d %Y, %l:%M %P')} - #{tournament.end_at.strftime('%B %d %Y, %l:%M %P')}"
  end
end
