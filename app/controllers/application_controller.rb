class ApplicationController < ActionController::Base
  helper_method :current_user
  private
  def current_user
    @current_user ||= User.find_by(id: session[:id_user]) if session[:id_user]
  end
end
