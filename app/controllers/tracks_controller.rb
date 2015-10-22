class TracksController < ApplicationController

  def new
    @track ||= Track.new
    @track.album_id ||= params[:album_id]
    @curr_band = Album.find(@track.album_id).band
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track.id)
    else
      @curr_band = Album.find(@track.album_id).band
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
  end

private
  def track_params
    params.require(:track).permit(:album_id, :title, :bonus, :lyrics)
  end

end
