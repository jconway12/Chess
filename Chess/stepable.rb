module Stepable
  def moves
    moves = []
    start_pos = self.pos 

    self.move_diffs.each do |move|
      possible_move = [start_pos[0] + move[0], start_pos[1] + move[1]]
      if (possible_move.all? { |ele| ele.between?(0, 7) } && 
      self.board[possible_move].color != self.color)
        moves << possible_move
      end
    end

    moves
  end



  private
  def move_diffs
  end
end