class PiecesController < ApplicationController
	def update
		Piece.find(params[:id]).update_attributes(piece_params)
		render json: {}, status: :ok
	end

	def piece_params
	  params.require(:piece).permit(:type)
	end
end
