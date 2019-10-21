
require_relative "piece"

class Pawn < Piece

  def symbol
    :P
  end

  def moves
    moves = forward_steps + side_attacks
    moves.select do |move|
      move.all? { |ele| ele.between?(0, 7) }
    end
  end

  private
  def at_start_row?
    return true if self.color == :white && self.pos[0] == 1
    return true if self.color == :black && self.pos[0] == 6
    false
  end

  def forward_dir
    return 1 if self.color == :white
    return -1 if self.color == :black
  end

  def forward_steps
    moves = []
    pos1 = [pos[0] + forward_dir, pos[1]]
    pos2 = [pos[0] + 2*forward_dir, pos[1]]
    if self.board[pos1] != self.board.nullpiece
      return []
    else
     moves << pos1
    end
    if at_start_row? && self.board[pos2] == self.board.nullpiece
      moves << pos2
    end

    moves
  end

  def side_attacks
   attack_moves = []
   op_color = self.color == :white ? :black : :white
   pos1 = [pos[0] + forward_dir,  pos[1] + 1]
   pos2 = [pos[0] + forward_dir,  pos[1] - 1]

   if self.board[pos1].color == op_color
    attack_moves << pos1
   end
   if self.board[pos2].color == op_color
    attack_moves << pos2
   end

   attack_moves
  end
  
end

