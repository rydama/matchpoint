class MatchesController < ApplicationController
  before_action :load_tournament

  private

  def load_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
end
