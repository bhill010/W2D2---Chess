require_relative "board"
require_relative "SlidingPiece.rb"


class Bishop < Piece
  include SlidingPiece

  attr_reader :position

  def initialize(position, value = "B")
    @position = position
    @value = value
  end

  def moves
    puts "#{@position + DIAGONAL_DELTAS[0]}"
    puts "#{@position + DIAGONAL_DELTAS[1]}"
    puts "#{@position + DIAGONAL_DELTAS[2]}"
    puts "#{@position + DIAGONAL_DELTAS[3]}"
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Bishop.new([2, 0])
  b.moves
end
