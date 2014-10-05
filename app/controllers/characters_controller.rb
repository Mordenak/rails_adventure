class CharactersController < ApplicationController
  def index
  end

  def new
    @character = Character.new
  end


  def create

    @character = User.new(character_params)
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


end
