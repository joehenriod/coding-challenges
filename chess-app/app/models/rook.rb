class Rook < Piece
  def valid_moves
    moves = BOARD.map do |coordinate|
      # .map will return an array of whatever is at the end of the loop
      x = coordinate.first
      y = coordinate.last
      if x_position == x || y == y_position
        # since this is at the end of the loop, this will be returned by .map if the x's match or the y's match
        coordinate
      end
    end

    return moves.compact
  end
end
