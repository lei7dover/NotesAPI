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
    if params[:api_token]
      @notes=Note.find_by api_token:params[:api_token]
    else
      @notes = Note.all
      render json: @notes
    end
  end

  private

  def notes_params
    params.require(:notes).permit(:title, :body)
  end

end
