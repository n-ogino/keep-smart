class ApplicationController < ActionController::Base

  before_action :set_current_user
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
