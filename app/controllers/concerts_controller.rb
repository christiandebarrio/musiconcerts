class ConcertsController < ApplicationController

  def index
    @concerts = Concert.all
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)

    if @concert.save
      redirect_to concerts_path
    else
      render 'new'
    end
  end

  private

  def concert_params
    params.require(:concert).permit(:band, :venue, :city, :date, :price, :description)
  end
end
