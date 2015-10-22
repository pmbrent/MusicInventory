class AlbumsController < ApplicationController

  def new
    @album ||= Album.new
    @album.band_id ||= params[:band_id]
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album.id)
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
    a = Album.find(params[:id])
    band = a.band_id
    a.delete
    redirect_to band_url(band)
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album.id)
    else
      render :edit
    end
  end

private
  def album_params
    album_params = params.require(:album).permit(:title, :band_id, :live)
  end
end
