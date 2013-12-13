class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(params[:session])
    @session = Session.new(:user_id => @user.id, :token => Session.generate_token)
    if @user
      login!(@session)
      redirect_to iguanas_url
    else
      flash.now[:notices] = ["Invalid username / password."]
      render :new
    end
  end

  def destroy
    logout!(current_session)
    redirect_to new_session_url
  end

  def new
    render :new
  end

end
