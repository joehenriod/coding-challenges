class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    @users = User.where.not(id: current_user[:id])
  end

  def create
    @game = Game.create_game(game_params.merge(white_player: current_user))
    
    if @game.valid?
      redirect_to edit_game_path(@game)
    else
      @users = User.where.not(id: current_user[:id])
      render :new, :status => :unprocessable_entity
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])

    move_result = game.move_piece(params[:game][:piece_id], params[:game][:destination].map(&:to_i))

    if (move_result[:valid_move])
      render json: { promotable: move_result[:promotable] }, status: :ok
    else
      render json: { error: "Houston, we have a problem" }, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:black_player_id)
  end
end
