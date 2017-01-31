class Piece
  attr_reader :value

  def initialize(value = "P")
    @value = value
    # puts "#{@value}"
  end
end
