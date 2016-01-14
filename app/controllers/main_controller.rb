class MainController < ApplicationController
  def index
    @games = Game.paginate(:page => params[:page])
  end
end
