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
    if g.move_piece(params[:game][:origin], params[:game][:destination], params[:id])
      render json: {}, status: :ok
    else
      render json: { error: "Houston, we have a problem" }, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:users)
  end
end
