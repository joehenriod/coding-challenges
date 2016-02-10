class Knight < Piece
  def valid_moves
    moves = BOARD.map do |coordinate|
      x = coordinate.first
      y = coordinate.last
      if (x_position - x).abs == 2 && (y_position - y).abs == 1
        coordinate
      elsif (x_position - x).abs == 1 && (y_position - y).abs == 2
        coordinate
      end
    end

    return moves.compact
  end 

end
