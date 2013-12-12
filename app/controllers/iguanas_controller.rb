class IguanasController < ApplicationController

  def index
    @iguanas = Iguana.all
    render :index
  end

  def create
    @iguana = Iguana.new(params[:iguana])
    if @iguana.save
      redirect_to iguana_url(@iguana)
    else
      @errors = @iguana.errors.full_messages
      render :new
    end
  end

  def edit
    @iguana = Iguana.find(params[:id])
    render :edit
  end

  def new
    @iguana = Iguana.new
    render :new
  end

  def show
    @iguana = Iguana.find(params[:id])
    @requests = @iguana.iguana_house_cleaning_requests.order('start_date')
    render :show
  end

  def update
    @iguana = Iguana.find(params[:id])
    if @iguana.update_attributes(params[:iguana])
      redirect_to iguana_url(@iguana)
    else
      @errors = @iguana.errors.full_messages
      render :edit
    end
  end
end
