class Queens
  attr_accessor :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black
  end

  def to_s
    board = []
    8.times {board << %w(_ _ _ _ _ _ _ _)}
    board[white[0]][white[1]] = 'W'
    board[black[0]][black[1]] = 'B'

    board.map { |row| row.join(' ')}.join("\n")
  end

  def attack?
    white[0] == black[0] || white[1] == black[1] || is_diagonal?
  end

  private
  def is_diagonal?
    (white[0] - black[0]).abs == (white[1] - black[1]).abs
  end

end