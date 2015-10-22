class BandsController < ApplicationController

  before_action :ensure_logged_in

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
    Band.find(params[:id]).delete
    redirect_to bands_url
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band.id)
    else
      render :edit
    end
  end

private

  def band_params
    params.require(:band).permit(:name)
  end

end
