require "byebug"
# require_relative "rook"
# require_relative "bishop"
# require_relative "queen"

module Slideable
  HORIZONTAL_DIRS = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL_DIRS = [[-1, -1], [1, 1], [-1, 1], [1, -1]]

  def horizontal_dirs  
    moves = []

    HORIZONTAL_DIRS.each do |direction|
      moves += grow_unblocked_moves_in_dir(direction[0], direction[1])
      # debugger
    end

    moves
  end

  def diagonal_dirs  
    moves = []

    DIAGONAL_DIRS.each do |direction|
      moves += grow_unblocked_moves_in_dir(direction[0], direction[1])
      # debugger
    end

    moves
  end

  def moves 
    if self.move_dirs == "horizontal"
      self.horizontal_dirs
    elsif self.move_dirs == "diagonal"
      self.diagonal_dirs
    elsif self.move_dirs == "both"
      self.horizontal_dirs + self.diagonal_dirs
    end
  end

  private
  def move_dirs
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    start_pos = self.pos
    moves = []
    moves << [start_pos[0] + dx, start_pos[1] + dy]
    op_color = self.color == :white ? :black : :white
    
    # while moves[-1].all? { |el| el.between?(0, 7) } 
    # && (self.board[moves[-1]] == self.nullpiece) 
    # || 

    until moves[-1].any? { |el| el > 7 || el < 0 } || 
      self.board[moves[-1]].color == self.color
      possible_move = [moves[-1][0] + dx, moves[-1][1] + dy]
      moves << possible_move
      if self.board[moves[-2]].color == op_color
        break
      end
    end

    moves[0...-1]
  end 

end