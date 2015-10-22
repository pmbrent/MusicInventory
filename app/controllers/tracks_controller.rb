class TracksController < ApplicationController

  before_action :ensure_logged_in

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

  def destroy
    t = Track.find(params[:id])
    album = t.album_id
    t.delete
    redirect_to album_url(album)
  end

  def edit
    @track = Track.find(params[:id])
    @curr_band = Album.find(@track.album_id).band
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track.id)
    else
      @curr_band = Album.find(@track.album_id).band
      render :new
    end
  end

private
  def track_params
    params.require(:track).permit(:album_id, :title, :bonus, :lyrics)
  end

end
