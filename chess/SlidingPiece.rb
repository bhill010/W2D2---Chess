module SlidingPiece
  def move_dirs
    deltas = []
    (-7..7).each do |i|
      (-7..7).each do |j|
        if i == 0 || j == 0 || i == j
          deltas << [i, j] unless [i,j] == [0,0]
        end
      end
    end
    deltas
  end

  #VERTICAL_DELTAS = move_dirs.select{|el| el[0] == 0}
  #HORIZONTAL_DELTAS = move_dirs.select{|el| el[1] == 0}
  #DIAGONAL_DELTAS = move_dirs.select{|el| el[0] == el[1]}

  VERTICAL_DELTAS = [
    [0, 1],
    [0, -1]
  ]
  HORIZONTAL_DELTAS = [
    [1, 0],
    [-1, 0]
  ]
  DIAGONAL_DELTAS = [
    [1, 1],
    [-1, 1],
    [-1, -1],
    [1, -1]
  ]

end
