class MatchesController < ApplicationController
  before_action :load_tournament

  def generate
    if MatchGeneratorService.generate_matches(@tournament)
      flash[:notice] = "Matches generated successfully."
    else
      flash[:alert] = "There was a problem generating matches."
    end
    redirect_to tournament_path(@tournament)
  end

  private

  def load_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
end
