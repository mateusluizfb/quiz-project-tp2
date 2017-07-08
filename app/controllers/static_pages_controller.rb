##
# This class is used to render the static pages of the application.

class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  ##
  # Renders an User's dashboard.
  def dashboard
  end
end
