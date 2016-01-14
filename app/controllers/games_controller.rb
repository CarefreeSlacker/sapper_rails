class GamesController < ApplicationController
  before_action :initialize_game, only: :edit

  def create
    @new_game = Game.new(game_attributes)
    if @new_game.save!
      redirect_to edit_game_path(@new_game)
    else
      redirect_to '/'
    end
  end

  def edit
    respond_to do |format|
      format.text { render text: @game.decorate.make_grid }
      format.html
    end
  end

  private

  def game_attributes
    params.require(:games).permit(:username, :bombs_count, :fields_height, :fields_width)
  end

  def set_game
    @game = Game.includes(:cells).find(params[:id])
  end

  def initialize_game
    set_game
    GameInitializer.new(game: @game).perform
    @game.reload
  end
end
