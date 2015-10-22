class TracksController < ApplicationController

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
  end

  def show
    @track = Track.find(params[:id])
  end

private
  def track_params
    params.require(:track).permit(:album_id, :title, :bonus)
  end


end
