class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @users = User.all
    @game = Game.new
  end

  def create
    @game = Game.create_game(game_params)
    redirect_to edit_game_path(@game)
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    g = Game.find(params[:id])
    g.move_piece(params[:game][:origin], params[:game][:destination], params[:id])
    render text: 'success'
  end

  private

  def game_params
    params.require(:game).permit(:users)
  end
end
