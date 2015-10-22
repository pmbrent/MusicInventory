class BandsController < ApplicationController

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band.id)
    else
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
  end

  def destroy

  end

  def update

  end

private

  def band_params
    params.require(:band).permit(:name)
  end

end
