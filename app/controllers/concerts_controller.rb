class ConcertsController < ApplicationController

  def index
    @concerts = Concert.available.order_asc
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)

    if @concert.save
      flash[:notice] = 'Concert added successfully'
      redirect_to concerts_path
    else
      flash[:alert] = "Sorry, something went wrong."
      render 'new'
    end
  end

  private

  def concert_params
    params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
  end
end
