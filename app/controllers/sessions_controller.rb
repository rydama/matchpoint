class SessionsController < Clearance::SessionsController
  def url_after_destroy
    root_url
  end
end
