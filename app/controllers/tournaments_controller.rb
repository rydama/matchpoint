class TournamentsController < ApplicationController
  before_action :require_login

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.owner = current_user
    if @tournament.save
      flash[:notice] = "Your tournament was created."
      redirect_to @tournament
    else
      flash.now[:alert] = "There was a problem saving the tournament. #{first_error(@tournament)}"
      render "new"
    end
  end

  private

  def tournament_params
    params.require(:tournament).permit(:name, :description, :start_at, :end_at)
  end

  def first_error(tournament)
    if tournament.errors.any?
      tournament.errors.full_messages.first
    end
  end
end
