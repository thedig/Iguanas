module SessionsHelper

  def login!(session)
    if session.save
      session[:session_token] = session.token
    else
      flash.now[:notices] = ["Invalid session."]
    end
  end

  def logout!(session)
    return nil if session.nil?
    session.terminate!
    session[:session_token] = nil
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= Session.find_by_token(session[:session_token]).user
  end

  def current_session
    return nil if session[:session_token].nil?
    @current_session ||= Session.find_by_token(session[:session_token])
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