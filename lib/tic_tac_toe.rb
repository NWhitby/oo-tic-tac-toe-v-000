class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
    WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    index_1 = win_combination[0]
    index_2 = win_combination[1]
    index_3 = win_combination[2]

    position_1 = board[index_1]
    position_2 = board[index_2]
    position_3 = board[index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end

def draw?(board)
  full?(board) && !won?(board)
end

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    win_combination = won?(board)
    if board[win_combination[0]] == "X"
      return "X"
    elsif board[win_combination[0]] == "O"
      return "O"
    end
  end
end
end
