class NotesController < ApplicationController
  def create
    @note = Note.new(notes_params)
    if @note.save
      Rails.logger.info params[:notes][:tags]
      @note.tag_names=(params[:notes][:tags])
      render json: @note
    else
      render json: @note.errors, :status => :bad_request
    end
  end

  def index
    @notes = Note.all
      render json: @notes
  end

  private

  def notes_params
    params.require(:notes).permit(:title, :body)
  end

end
