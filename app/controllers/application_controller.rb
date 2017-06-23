##
# This is the Application Controller. This is where we define methods for all the controllers in this Application. 
# We include here the DisciplinesHelper, which is used in several controllers. 

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include DisciplinesHelper

  ##
	# Redirect user to his Dashoboard after sign in.
  def after_sign_in_path_for(_resource)
    dashboard_url
  end
end
