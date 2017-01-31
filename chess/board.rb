require_relative 'piece'
require_relative 'null_piece'

class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) {Array.new(8){ NullPiece.new }}
    setup
  end

  def setup
    piece_rows = [0,1,6,7]
    @board.each_with_index do |row, i|
      if piece_rows.include?(i)
        row.each_with_index do |el, col|
          @board[i][col] = Piece.new
        end
      end
    end
  end

  def []=(pos, value)
    x,y = pos
    @board[x][y] = value
  end

  def [](pos)
    x,y = pos
    @board[x][y]
  end

  def display
    string = "  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |\n"
    @board.each_with_index do |row, i|
      row_string = "#{i} |"
      row.each_with_index do |el, col|
        row_string << " #{ @board[i][col].value } |"
      end
        row_string << "\n"
        string << row_string
        row_string = ""
    end

    puts string
  end

  # def render
  #   puts "  #{(0..7).to_a.join(" ")}"
  #   @board.each_with_index do |row, i|
  #     row.each_with_index do |col, j|
  #       puts "#{i} #{row.join(" ")}"
  #     end
  #   end
  # end

  def move_piece(start_position, end_position)
    #update piece position
    start_x = start_position[0]
    start_y = start_position[1]

    end_x = end_position[0]
    end_y = end_position[1]
    @board[end_x][end_y] = @board[start_x][start_y]
    @board[start_x][start_y] = NullPiece.new
    #update grid

    #raise error if
      #no piece is at start position


      #cannot go to end position
  end
end

# iterate over board
  #if row = index that we want
    #iterate over that row and select columns
