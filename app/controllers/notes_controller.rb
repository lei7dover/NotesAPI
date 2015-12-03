class NotesController < ApplicationController
  def create
    @notes = Note.new(notes_params)
    if @notes.save
      render json: @notes
    else
      render json: @notes.errors
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
