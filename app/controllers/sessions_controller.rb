class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(params[:session])
    login!(@user)
    redirect_to iguanas_url
  end

  def destroy
    logout!(current_user)
    redirect_to new_session_url
  end

  def new
    render :new
  end

end
