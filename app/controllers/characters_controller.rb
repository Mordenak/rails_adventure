class CharactersController < ApplicationController

  before_action :set_character, only: [:show]

  def index
  end

  def new
    @character = Character.new
  end

  def show

  end

  def create

    @character = Character.new(character_params)

    @character.user_id = session[:user_id]
    # @character.save!

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'character was successfully created.' }
        format.json { render action: 'show', status: :created, location: @character }
      else
        format.html { render action: 'new' }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end

  end

  private

    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params[:character].permit(:name, :race_id, :pc_class_id )
    end


end
