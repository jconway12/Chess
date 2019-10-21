class Piece
  attr_reader :color, :pos, :board

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    self.symbol.to_s
  end

  def empty?
    false
  end

  def valid_moves(moves)
    # moves.reject do |pos|
    #   self.board[pos].color == self.color
    # end
    moves
  end

  def pos=(val)
    self.pos = val
  end

  def symbol
    nil
  end

  private
  def move_into_check?(end_pos)
    
  end

end