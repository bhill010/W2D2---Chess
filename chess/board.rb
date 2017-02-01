require_relative 'piece'
require_relative 'null_piece'
require_relative 'bishop'
require_relative 'rook'
require_relative 'knight'
require_relative 'queen'
require_relative 'king'

class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) {Array.new(8){ NullPiece.instance }}
    setup
  end

  def setup
    piece_rows = [0,1,6,7]
    @board.each_with_index do |row, i|
      if piece_rows.include?(i)
        row.each_with_index do |el, col|
          t_position = [i, col]
          puts "#{t_position}"
          case [i, col]
          when [0, 0]
            @board[i][col] = Rook.new([0, 0])
          when [0, 7]
            @board[i][col] = Rook.new([0, 7])
          when [7, 0]
            @board[i][col] = Rook.new([7, 0])
          when [7, 7]
            @board[i][col] = Rook.new([7, 7])
          when [0, 1]
            @board[i][col] = Knight.new([0, 1])
          when [0, 6]
            @board[i][col] = Knight.new([0, 6])
          when [7, 1]
            @board[i][col] = Knight.new([7, 1])
          when [7, 6]
            @board[i][col] = Knight.new([7, 6])
          when [0, 2]
            @board[i][col] = Bishop.new([0, 2])
          when [0, 5]
            @board[i][col] = Bishop.new([0, 5])
          when [7, 2]
            @board[i][col] = Bishop.new([7, 2])
          when [7, 5]
            @board[i][col] = Bishop.new([7, 5])
          when [0, 3]
            @board[i][col] = Queen.new([0, 3])
          when [7, 3]
            @board[i][col] = Queen.new([7, 3])
          when [0, 4]
            @board[i][col] = King.new([0, 4])
          when [7, 4]
            @board[i][col] = King.new([7, 4])
          else
            @board[i][col] = Piece.new
          end
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

  # def display
  #   string = "  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |\n"
  #   @board.each_with_index do |row, i|
  #     row_string = "#{i} |"
  #     row.each_with_index do |el, col|
  #       row_string << " #{ @board[i][col].value } |"
  #     end
  #       row_string << "\n"
  #       string << row_string
  #       row_string = ""
  #   end
  #
  #   puts string
  # end

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

    if @board[start_x][start_y].is_a?(NullPiece)
       raise ArgumentError.new "No piece at position"
    end

    unless end_position.all? { |x| x.between?(0, 7) }
      raise ArgumentError.new "End position not on board"
    end

    # rescue ArgumentError => e
    #   puts "Invalid move"
    #   puts "Error was: #{e}"
    # end

    @board[end_x][end_y] = @board[start_x][start_y]
    @board[start_x][start_y] = NullPiece.instance
  end
end

# iterate over board
  #if row = index that we want
    #iterate over that row and select columns
