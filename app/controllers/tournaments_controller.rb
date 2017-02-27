class TournamentsController < ApplicationController
  before_action :require_login
  before_action :load_tournament, except: [:index, :new, :create]

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
      flash.now[:alert] = "There was a problem saving the tournament. #{first_model_error(@tournament)}."
      render "new"
    end
  end

  def update
    if @tournament.update_attributes(tournament_params)
      flash[:notice] = "Your tournament was updated."
      redirect_to @tournament
    else
      flash.now[:alert] = "There was a problem updating the tournament. #{first_model_error(@tournament)}."
      render "edit"
    end
  end

  def generate_matches
    if MatchGeneratorService.new.generate_for(@tournament)
      flash[:notice] = "Matches generated successfully."
    else
      flash[:alert] = "There was a problem generating matches."
    end
    redirect_to tournament_path(@tournament)
  end

  private

  def load_tournament
    @tournament = Tournament.find(params[:id])
  end

  def tournament_params
    params.require(:tournament).permit(:name, :description, :start_at, :end_at)
  end
end
