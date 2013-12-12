class IguanaHouseCleaningRequestsController < ApplicationController

  def approve
    @request = IguanaHouseCleaningRequest.find(params[:id])
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

  end

  def new
    @iguanas = Iguana.all
    render :new
  end


end