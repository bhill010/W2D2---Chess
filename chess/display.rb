require 'colorize'
require_relative 'cursor'
require_relative 'board'
require_relative 'bishop'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    display_string = "    0  1  2  3  4  5  6  7 " + "\n"

    @board.board.each_with_index do |row, i|
      # row_header = "#{i} |"
      row_str = "#{i}  |"
      row.each_with_index do |el, col|
        # if [i,col] == @cursor.cursor_pos
        #   row_str << @board[[i,col]].value.colorize( :background => :red) + " |"
        # else
          #row_str << @board[[i,col]].value + " |"
          if i.even? && col.even?
            row_str << (" " + @board[[i,col]].value + " ").colorize( :background => :gray)
          elsif i.even? && col.odd?
            row_str << (" " + @board[[i,col]].value + " ").colorize( :background => :white)
          elsif i.odd? && col.even?
            row_str << (" " +@board[[i,col]].value + " ").colorize( :background => :white)
          else
            row_str << (" " + @board[[i,col]].value + " ").colorize( :background => :gray)
          # end
        end
      end
        display_string << row_str + "\n"
        row_str = ""
    end

    puts display_string
  end

  def render_loop
    while true
      system("clear")
      render
      @cursor.get_input
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  d.render
  d.render_loop
end
