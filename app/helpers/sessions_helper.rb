module SessionsHelper

  def login!(user)
    return nil if user.nil?
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout!(user)
    return nil if user.nil?
    user.reset_session_token!
    session[:session_token] = nil
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_current_user!
    unless logged_in?
      flash[:notices] = ["You must be logged in to do that"]
      redirect_to new_session_url
    end
  end


end