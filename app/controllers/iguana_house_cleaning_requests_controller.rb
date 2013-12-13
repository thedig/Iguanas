class IguanaHouseCleaningRequestsController < ApplicationController
  before_filter :require_current_user!
  before_filter :require_owner, :only => [:approve, :deny]

  def approve
    #@request = IguanaHouseCleaningRequest.find(params[:id])
    @request.approve!
    redirect_to iguana_url(@request.iguana_id)
  end

  def create
    @request = IguanaHouseCleaningRequest.new(params[:request])

    if @request.save
      redirect_to new_iguana_house_cleaning_request_url
    else
      @errors = @request.errors.full_messages
      @iguanas = Iguana.all
      render :new
    end
  end

  def deny
    #@request = IguanaHouseCleaningRequest.find(params[:id])
    @request.deny!
    redirect_to iguana_url(@request.iguana_id)
  end

  def new
    @iguanas = Iguana.all
    render :new
  end

  private

  def require_owner
    @request = IguanaHouseCleaningRequest.find(params[:id])
    iguana = Iguana.find(@request.iguana_id)
    unless iguana.user_id == current_user.id
      flash[:notices] = ["You can only approve/deny your own iguanas"]
      redirect_to iguanas_url
    end
  end


end