class Pawn < Piece

  def valid_moves
    moves = BOARD.map do |coordinate|
      x = coordinate.first
      y = coordinate.last

      delta_x = (x - x_position).abs
      delta_y = is_white ? y - y_position : y_position - y

      if delta_y == 2 && first_move?
        coordinate if delta_x == 0
      elsif delta_y == 1
        coordinate if delta_x <= 1
      end
    end

    return moves.compact
  end

  def first_move?
    y_position == 1 || y_position == 6
  end

  def move_path(destination)
    moves = valid_moves

    if is_diagonal_move?(destination)
      moves.delete_if { |move| is_straight_move?(move) }
    end

    return move_area(destination) & moves
  end
  
  def promotable?
    last_rank = is_white ? 7 : 0;

    return y_position == last_rank
  end
end
