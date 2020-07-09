class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_admin
    redirect_to '/' unless (current_user && current_user.privilege == 2)
    #if !(current_user && current_user.privilege == 2)
      #redirect_to '/'
    #end
  end
end
