class HomeController < ApplicationController
  before_action :require_login

  def index
    @my_tournaments = current_user.tournaments.future
  end
end
