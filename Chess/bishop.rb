require_relative "slideable"
require_relative "piece"

class Bishop < Piece
  include Slideable

  def symbol
    :B
  end

  def move_dirs
    return "diagonal"
  end

end