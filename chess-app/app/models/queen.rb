class Queen < Piece
  def valid_moves
    moves = BOARD.map do |coordinate|
      # .map will return an array of whatever is at the end of the loop
      x = coordinate.first
      y = coordinate.last
      if x_position == x || y == y_position || ((x - x_position).abs == (y - y_position).abs)
        # since this is at the end of the loop, this will be returned by .map if the x's match or the y's match
        coordinate
      end
    end

    return moves.compact
  end

  def move_path(destination)
    moves = valid_moves

    if is_diagonal_move?(destination)
      moves.delete_if { |move| is_straight_move?(move) }
    end

    return move_area(destination) & moves
  end
end
