class Piece < ActiveRecord::Base
  enum status: [ :uncaptured, :captured ]

  belongs_to :game
  belongs_to :user

  BOARD = [[0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0],
           [0, 1], [1, 1], [2, 1], [3, 1], [4, 1], [5, 1], [6, 1], [7, 1],
           [0, 2], [1, 2], [2, 2], [3, 2], [4, 2], [5, 2], [6, 2], [7, 2],
           [0, 3], [1, 3], [2, 3], [3, 3], [4, 3], [5, 3], [6, 3], [7, 3],
           [0, 4], [1, 4], [2, 4], [3, 4], [4, 4], [5, 4], [6, 4], [7, 4],
           [0, 5], [1, 5], [2, 5], [3, 5], [4, 5], [5, 5], [6, 5], [7, 5],
           [0, 6], [1, 6], [2, 6], [3, 6], [4, 6], [5, 6], [6, 6], [7, 6],
           [0, 7], [1, 7], [2, 7], [3, 7], [4, 7], [5, 7], [6, 7], [7, 7]]

  def move(destination)
    update(x_position: destination[0], y_position: destination[1])
  end

  def valid_move?(destination)
    !(valid_moves & [destination]).blank?
  end

  def valid_moves
    []
  end

  def move_area(destination)
    x_range = destination[0] > x_position ? (x_position..destination[0]) : (destination[0]..x_position)
    y_range = destination[1] > y_position ? (y_position..destination[1]) : (destination[1]..y_position)
    
    move_area = []

    x_range.each do |x|
      y_range.each do |y|
        move_area << [x, y] unless (x == x_position && y == y_position) || (x == destination[0] && y == destination[1])
      end
    end

    return move_area
  end

  def move_path(destination)
    return move_area(destination) & valid_moves
  end

  def capture
    update! status: 1
  end

  def is_straight_move?(destination)
    return (x_position == destination[0] || y_position == destination[1])
  end

  def is_diagonal_move?(destination)
    return (x_position != destination[0] && y_position != destination[1])
  end

  def promotable?
    return false
  end
end
