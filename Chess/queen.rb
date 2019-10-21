require_relative "slideable"
require_relative "piece"

class Queen < Piece
  include Slideable

  def symbol
    :Q
  end

  def move_dirs
    return "both"
  end
  
end