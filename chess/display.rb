require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def header_render
    header = ((0..7).to_a).map.with_index do |el, idx|
      if idx == 0
        "  " + el.to_s
      else
      el.to_s
      end
    end
    print header
    print "\n"
  end

  def render
    header_render

    render_arr = []
    @board.board.each_with_index do |row, i|
      # row_header = "#{i} |"
      row_arr = []
      row.each_with_index do |el, col|
        row_arr << @board[[i,col]].value

      end
        render_arr << row_arr
    end
    render_arr.each_with_index do |row, idx|
      print " " + idx.to_s
      p row
    end
    # @board.board[@cursor.cursor_pos].colorize(:background => :red)

    # p @cursor.cursor_pos
  end

  # def render_loop
  #   while true
  #     render
  #     @cursor.get_input
  #   end
  # end

end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  d.render
  # d.render_loop
end
