require 'singleton'

class NullPiece < Piece
  include Singleton
  attr_reader :value, :color, :symbol

  def initialize(value = " ")
    @value = value
    @color = color
  end
end
