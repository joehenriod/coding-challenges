class Game < ActiveRecord::Base
  belongs_to :black_player, class_name: User 
  belongs_to :white_player, class_name: User
  has_many :pieces

  validates :black_player_id, :presence => true
  validates :white_player_id, :presence => true

  def self.create_game(game_params)
    game = Game.create(game_params)
    game.create_pieces if game.valid? 
   
    return game
  end

  def create_pieces
    Piece.create(type: 'Pawn',   x_position: 0, y_position: 1, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Pawn',   x_position: 1, y_position: 1, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Pawn',   x_position: 2, y_position: 1, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Pawn',   x_position: 3, y_position: 1, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Pawn',   x_position: 4, y_position: 1, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Pawn',   x_position: 5, y_position: 1, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Pawn',   x_position: 6, y_position: 1, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Pawn',   x_position: 7, y_position: 1, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Pawn',   x_position: 0, y_position: 6, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Pawn',   x_position: 1, y_position: 6, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Pawn',   x_position: 2, y_position: 6, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Pawn',   x_position: 3, y_position: 6, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Pawn',   x_position: 4, y_position: 6, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Pawn',   x_position: 5, y_position: 6, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Pawn',   x_position: 6, y_position: 6, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Pawn',   x_position: 7, y_position: 6, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Rook',   x_position: 0, y_position: 0, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Rook',   x_position: 7, y_position: 0, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Rook',   x_position: 0, y_position: 7, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Rook',   x_position: 7, y_position: 7, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Knight', x_position: 1, y_position: 0, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Knight', x_position: 6, y_position: 0, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Knight', x_position: 1, y_position: 7, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Knight', x_position: 6, y_position: 7, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Bishop', x_position: 2, y_position: 0, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Bishop', x_position: 5, y_position: 0, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Bishop', x_position: 2, y_position: 7, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Bishop', x_position: 5, y_position: 7, user: black_player, game: self, is_white: false)
    Piece.create(type: 'Queen',  x_position: 3, y_position: 0, user: white_player, game: self, is_white: true)
    Piece.create(type: 'Queen',  x_position: 3, y_position: 7, user: black_player, game: self, is_white: false)
    Piece.create(type: 'King',   x_position: 4, y_position: 0, user: white_player, game: self, is_white: true)
    Piece.create(type: 'King',   x_position: 4, y_position: 7, user: black_player, game: self, is_white: false)
  end

  def move_piece(piece_id, destination)
    @current_piece = Piece.find(piece_id)

    result = { valid_move: valid_move?(destination), promotable: false }
    
    # valid move?
    return result unless result[:valid_move]

    # move
    @current_piece.move(destination)

    # capture
    pieces.each do |piece|
      next if piece == @current_piece
      piece.capture if [piece.x_position, piece.y_position] == destination
    end

    # promotion
    result[:promotable] = @current_piece.promotable?

    return result
  end

  private

  def valid_move?(destination)
    return false unless @current_piece.valid_move?(destination)
    return false if is_obstructed?(destination)

    if valid_white_player_turn? || valid_black_player_turn?
      self.turns += 1
      save
      return true
    end
  end

  def valid_white_player_turn?
    return true if @current_piece.is_white? && self.turns % 2 == 0
  end

  def valid_black_player_turn?
    return true if !@current_piece.is_white? && self.turns % 2 != 0
  end

  def is_obstructed?(destination)
    move_path = @current_piece.move_path(destination)

    pieces.each do |piece|
      next if piece.captured?
      return true if move_path.include? [piece.x_position, piece.y_position]
      return true if [piece.x_position, piece.y_position] == destination && @current_piece.user_id == piece.user_id
      return true if [piece.x_position, piece.y_position] == destination && @current_piece.type == 'Pawn' && @current_piece.is_straight_move?(destination)
    end

    return false
  end

end
