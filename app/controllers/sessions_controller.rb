class SessionsController < ApplicationController
  before_filter :require_current_user!, :except => [:create, :new]

  def create
    @user = User.find_by_credentials(params[:session])
    if @user
      @session = Session.new(:user_id => @user.id, :token => Session.generate_token)
      login!(@session)
      redirect_to iguanas_url
    else
      flash.now[:notices] = ["Invalid username / password."]
      render :new
    end
  end

  def destroy
    @session = Session.find(params[:id])
    logout!(@session)
    redirect_to new_session_url if current_session.nil?
    redirect_to sessions_url unless current_session.nil?
  end

  def index
    @sessions = current_user.sessions
    render :index
  end

  def new
    render :new
  end



end
