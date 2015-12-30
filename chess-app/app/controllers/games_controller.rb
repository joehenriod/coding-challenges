class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @users = User.all
    @game = Game.new
  end

  def create
    @game = Game.create_game(game_params.merge(white_player: current_user))
    redirect_to edit_game_path(@game)
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])

    if game.move_piece(params[:game][:piece_id], params[:game][:destination].map(&:to_i))
      render json: {}, status: :ok
    else
      render json: { error: "Houston, we have a problem" }, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:black_player_id)
  end
end
