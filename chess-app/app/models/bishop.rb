class Bishop < Piece
  def valid_moves
    moves = BOARD.map do |file|
      next if file[0] == x_position && file[1] == y_position
      file if (file[0] - x_position).abs == (file[1] - y_position).abs
    end

    return moves.compact
  end
end
