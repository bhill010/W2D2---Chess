require_relative "board"

class Rook < Piece
  #include SlidingPiece

  attr_reader :position

  def initialize(position, value = "R")
    @position = position
    @value = value
  end

  def moves
  end
end
