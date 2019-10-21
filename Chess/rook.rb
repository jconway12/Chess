require_relative "slideable"
require_relative "piece"

class Rook < Piece
  include Slideable

  def symbol
    :R
  end

  def move_dirs
    return "horizontal"
  end
  
end