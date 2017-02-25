class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def first_model_error(model)
    if model.errors.any?
      model.errors.full_messages.first
    end
  end
end
