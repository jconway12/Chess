require_relative "piece"
require "singleton"

class NullPiece < Piece
  attr_reader :symbol
  include Singleton

  def initialize
  end

  def symbol
    :_
  end

  def empty?
    true
  end
end