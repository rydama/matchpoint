class SessionsController < Clearance::SessionsController

  # We override this so we can choose where to redirect to after the user signs out.
  def url_after_destroy
    root_url
  end
end
