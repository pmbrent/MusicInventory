class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id=current_user.id
    @note.save
    redirect_to track_url(@note.track_id)
  end


private
  def note_params
    params.require(:note).permit(:content,:track_id)
  end
end
