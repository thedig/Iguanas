module SessionsHelper

  def login!(session_obj)
    if session_obj.save
      session[:session_token] = session_obj.token
    else
      flash.now[:notices] = ["Invalid session."]
    end
  end

  def logout!(session_obj)
    return nil if session_obj.nil?
    if session_obj.id == current_session.id
      session[:session_token] = nil
    end
    session_obj.terminate!
  end

  def current_user
    return nil if current_session.nil?
    @current_user ||= current_session.user
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