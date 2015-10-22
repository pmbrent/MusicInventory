class AlbumsController < ApplicationController

  def new
    @album = Album.new
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
  end

  def update
  end

private
  def album_params
    album_params = params.require(:album).permit(:title, :band_id)
  end
end
