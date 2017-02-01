require_relative "board"

class King < Piece
  #include SlidingPiece

  attr_reader :position

  def initialize(position, value = "&")
    @position = position
    @value = value
  end

  def moves
  end
end
