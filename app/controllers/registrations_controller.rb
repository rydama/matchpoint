class RegistrationsController < ApplicationController
  before_action :require_login

  def create
    tournament = Tournament.find(params[:tournament_id])
    registration = Registration.new(tournament: tournament)
    registration.user = current_user
    registration.save!
    redirect_to redirect_path
  end

  def destroy
    Registration.find(params[:id]).destroy!
    redirect_to redirect_path
  end

  private

  def registration_params
    params.require(:tournament_id)
  end

  def redirect_path
    URI.parse(params[:redirect_to]).path
  rescue
    home_path
  end
end
