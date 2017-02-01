require_relative "board"

class Queen < Piece
  #include SlidingPiece

  attr_reader :position

  def initialize(position, value = "Q")
    @position = position
    @value = value
  end

  def moves
  end
end
