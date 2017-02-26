class RegistrationsController < ApplicationController
  before_action :require_login

  def create
    registration = Registration.new(registration_params)
    registration.user = current_user
    registration.save!
    head :ok
  end

  def destroy
    Registration.find(params[:id]).destroy!
    head :ok
  end

  private

  def registration_params
    params.require(:registration).permit(:tournament_id)
  end
end
