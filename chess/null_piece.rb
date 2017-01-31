require 'singleton'

class NullPiece < Piece
  include Singleton
  attr_reader :value

  def initialize(value = " ")
    @value = value
  end
end
