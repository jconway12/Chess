require_relative "piece"
require_relative "stepable"

class King < Piece
  include Stepable

  def symbol
    :K
  end

  def move_diffs
    [[-1, -1], [-1, 0], [-1, 1],
    [0, -1], [0, 1],
    [1, -1], [1, 0], [1, 1]]
  end
end