load "board.rb"
b = Board.new
b.display
b.move_piece([0,0], [3,4])
b.move_piece([0,0], [9,9])
b.display
