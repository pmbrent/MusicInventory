class AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def create
  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
  end

  def update
  end

end
