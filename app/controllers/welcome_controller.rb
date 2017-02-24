class WelcomeController < ApplicationController
  def index
    redirect_to home_path if signed_in?
  end
end
