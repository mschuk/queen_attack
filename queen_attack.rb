require 'pry'

class Queens
  attr_accessor :white, :black

  def initialize(positions = {})
    @board = []
    8.times {@board << %w(_ _ _ _ _ _ _ _)}

    positions = {white: [0, 3], black: [7, 3]} if positions.empty?
    @white = positions[:white]
    @black = positions[:black]
    @board[white[0]][white[1]] = 'W'
    @board[black[0]][black[1]] = 'B'

    raise ArgumentError if (white[0] == black[0]) && (white[1] == black[1])
  end

  def to_s
    b = @board
    "#{b[0][0]} #{b[0][1]} #{b[0][2]} #{b[0][3]} #{b[0][4]} #{b[0][5]} #{b[0][6]} #{b[0][7]}\n" +
    "#{b[1][0]} #{b[1][1]} #{b[1][2]} #{b[1][3]} #{b[1][4]} #{b[1][5]} #{b[1][6]} #{b[1][7]}\n" +
    "#{b[2][0]} #{b[2][1]} #{b[2][2]} #{b[2][3]} #{b[2][4]} #{b[2][5]} #{b[2][6]} #{b[2][7]}\n" +
    "#{b[3][0]} #{b[3][1]} #{b[3][2]} #{b[3][3]} #{b[3][4]} #{b[3][5]} #{b[3][6]} #{b[3][7]}\n" +
    "#{b[4][0]} #{b[4][1]} #{b[4][2]} #{b[4][3]} #{b[4][4]} #{b[4][5]} #{b[4][6]} #{b[4][7]}\n" +
    "#{b[5][0]} #{b[5][1]} #{b[5][2]} #{b[5][3]} #{b[5][4]} #{b[5][5]} #{b[5][6]} #{b[5][7]}\n" +
    "#{b[6][0]} #{b[6][1]} #{b[6][2]} #{b[6][3]} #{b[6][4]} #{b[6][5]} #{b[6][6]} #{b[6][7]}\n" +
    "#{b[7][0]} #{b[7][1]} #{b[7][2]} #{b[7][3]} #{b[7][4]} #{b[7][5]} #{b[7][6]} #{b[7][7]}"
  end

  def attack?
    white[0] == black[0] || white[1] == black[1] || is_diagonal?
  end

  private
  def is_diagonal?
    (white[0] - black[0]).abs == (white[1] - black[1]).abs
  end

end