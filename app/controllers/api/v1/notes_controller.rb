class Api::V1::NotesController < ApplicationController

  before_action :find_note, only: [:update, :destroy]

  def index
    @notes = Note.all
    render json: @notes
  end

  def create
  	@note = Note.create(note_params)
  	if @note.valid?
  	  render json: { purchase: NoteSerializer.new(@note) }, status: :created
  	else
  	  render json: { errors: @note.errors.full_messages }, status: :unprocessible_entity
  	end
  end
 
  def update
    @note.update(note_params)
    if @note.save
      render json: @note, status: :accepted
    else
      render json: { errors: @note.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @note.destroy
  end
 
  private
 
  def note_params
    params.permit(:title, :content, :user_id)
  end
 
  def find_note
    @note = Note.find(params[:id])
  end
end
