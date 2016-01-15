class ReactGamesController < GamesController
  def edit
    respond_to do |format|
      format.text { render text: @game.decorate.make_grid }
      format.html
    end
  end

  def initialize_game
    set_game
    GameInitializer.new(game: @game).perform
    @game.reload
  end
end