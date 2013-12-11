class IguanasController < ApplicationController

  def index
    @iguanas = Iguana.all
    render :index
  end

  def show
    @iguana = Iguana.find(params[:id])
    render :show
  end

end
