class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include DisciplinesHelper

  def after_sign_in_path_for(_resource)
    dashboard_url
  end
end
