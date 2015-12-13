class GamesController < ApplicationController
  def index
  	@games = Game.all
  end

  def new
  	@users = User.all
  	@game = Game.new
  end

  def create
  	@game = Game.create(game_params)
  	redirect_to edit_game_path(@game)
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    render :text => 'success'
  end

  private

  def game_params
    params.require(:game).permit(:users)
  end
end
