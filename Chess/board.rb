require_relative 'pieces'
require 'byebug'


class Board
  attr_reader :grid, :nullpiece

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    # debugger
    @nullpiece = NullPiece.instance
    create_board
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def [](pos)
    # debugger
    @grid[pos[0]][pos[1]]
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise ArgumentError if piece.is_a?(NullPiece)
    raise ArgumentError unless piece.moves.include?(end_pos)
    # debugger
    self[start_pos] = self.nullpiece
    self[end_pos] = piece
  end

  def valid_pos?(pos)
    pos.all? { |ele| ele.between?(0, 7) }
  end

  def add_piece(piece, pos)
  end

  def checkmate?(color)
    opposing_color = color == :white ? :black : :white
    if !in_check?(color)
      return false
    end
    pieces = pieces(opposing_color)
    pieces.each do |piece|
      return false if piece.valid_moves.length > 0
    end

    true
  end

  def in_check?(color)
    king_pos = find_king(color)
    opposing_pieces = pieces(color)
    opposing_pieces.each do |piece|
      return true if piece.moves.include?(king_pos)
    end

    false
  end

  def find_king(color)
    @grid.each_with_index do |row, row_idx|
      @row.each_with_index do |column, col_idx|
        if self[[row_idx, col_idx]].is_a?(King) && self[[row_idx, col_idx]].color == color
          return [row_idx, col_idx] 
        end
      end
    end
  end

  def pieces(color)
    op_color = color == :white ? :black : :white
    opposing_pieces = []
    @grid.flatten.each do |piece|
      if piece.color == op_color
        opposing_pieces << piece
      end
    end

    opposing_pieces
  end

  def dup
    board = Board.new
    new_grid = board.grid

    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|

        if self[[row_idx, col_idx]] == @nullpiece
          new_grid[row_idx][col_idx] = @nullpiece
        end
        if self[[row_idx, col_idx]].is_a?(King)
          king = self[[row_idx, col_idx]]
          new_grid[row_idx][col_idx] = King.new(king.color, board, king.pos)
        end
        if self[[row_idx, col_idx]].is_a?(Queen)
          queen = self[[row_idx, col_idx]]
          new_grid[row_idx][col_idx] = King.new(queen.color, board, queen.pos)
        end
        if self[[row_idx, col_idx]].is_a?(Rook)
          rook = self[[row_idx, col_idx]]
          new_grid[row_idx][col_idx] = King.new(rook.color, board, rook.pos)
        end
        if self[[row_idx, col_idx]].is_a?(Knight)
          knight = self[[row_idx, col_idx]]
          new_grid[row_idx][col_idx] = King.new(knight.color, board, knight.pos)
        end
        if self[[row_idx, col_idx]].is_a?(Bishop)
          bishop = self[[row_idx, col_idx]]
          new_grid[row_idx][col_idx] = King.new(bishop.color, board, bishop.pos)
        end
        if self[[row_idx, col_idx]].is_a?(Pawn)
          pawn = self[[row_idx, col_idx]]
          new_grid[row_idx][col_idx] = King.new(pawn.color, board, pawn.pos)
        end

      end
      board
    end

  end

  def move_piece!(color, start_pos, end_pos)
  end

  # def render
  #   @grid.each do |row|
  #     puts row.join(" ")
  #   end
  # end

  private
  def create_board
    @grid.each_with_index do |row, row_idx|
      if row_idx == 0
        fill_pieces(:white, row_idx)
      elsif row_idx == 1
        fill_pawns(:white, row_idx)
      elsif row_idx == 7
        fill_pieces(:black, row_idx)
      elsif row_idx == 6
        fill_pawns(:black, row_idx)
      else  
        fill_null(self.nullpiece, row_idx)
      end
    end
  end

  def fill_null(nullpiece, row_idx)
    @grid[row_idx].each.with_index do |space, idx|
      @grid[row_idx][idx] = nullpiece
    end
  end

  def fill_pawns(color, row_idx)
    @grid[row_idx].each.with_index do |space, idx|
      @grid[row_idx][idx] = Pawn.new(color, self, [row_idx, idx])
    end
  end

  def fill_pieces(color, row_idx)
     @grid[row_idx].each.with_index do |space, idx|
       if idx == 0 || idx == 7
       @grid[row_idx][idx] = Rook.new(color, self, [row_idx, idx])
      elsif idx == 1 || idx == 6
        @grid[row_idx][idx] = Knight.new(color, self, [row_idx, idx])
       elsif idx == 2 || idx == 5
         @grid[row_idx][idx] = Bishop.new(color, self, [row_idx, idx])
      elsif idx == 3
         @grid[row_idx][idx] = Queen.new(color, self, [row_idx, idx])
      else
        @grid[row_idx][idx] = King.new(color, self, [row_idx, idx])
      end
    end
  end

end

# b = Board.new
# b.render
# b.move_piece([0, 1], [2, 0])
# b.render
# b.move_piece([1, 1], [3, 1])
# b.render
# b.move_piece([1, 3], [2, 3])
# b.render
# b.move_piece([0, 2], [5, 7])
# b.render
# b.move_piece([6, 6], [4, 6])
# b.render
# b.move_piece([5, 7], [4, 6])
# b.render
