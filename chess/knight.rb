require_relative "board"

class Knight < Piece
  #include SlidingPiece

  attr_reader :position

  def initialize(position, value = "K")
    @position = position
    @value = value
  end

  def moves
  end
end
