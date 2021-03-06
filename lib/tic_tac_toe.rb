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
  [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    character = current_player
    if valid_move?(index)
     move(index, character)
     display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |turn|
    if turn == "X" || turn == "O"
    count += 1
    end
  end
  count
end

  def current_player
    if turn_count.even?
      "X"
    elsif turn_count.odd?
      "O"
    end
end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
    end
  end

  def full?
    @board.all?{|i| i == "X" || i == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    status = won?
    if status.nil?
      nil
    else
      @board[status[0]]
    end
  end

  def play
    turns = 0
  while turns < 9 && !over?
    turn
    turns += 1
  end

  if draw?
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner}!"
  end
  end
end
