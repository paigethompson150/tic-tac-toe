#class storing instance vars name and an array of positions
#if class contakns x,x,x, they win.
# set var for win set to false
#while win is false
#grid sjhoulf  d be an array odf positions so we can replace a 
#fixed posv w/ x or o

class Player
  attr_reader :name

  def initialize(player_number, name)
    @player_number = player_number
    @name = name
  end
end

class TicTacToe

  WIN_COMBOS = [
    [1,2,3],
    []
  ]
  attr_accessor :board_positions, :win, :winner

  def initialize(p1, p2)
    @p1 = p1 
    @p2 = p2 
    @board_positions = [1,2,3,4,5,6,7,8,9]
    @win = false 
    @winner = nil
    game
  end

  private 
  def game 
    
    available_positions = [1,2,3,4,5,6,7,8,9]
    
    def show_board(board)
      row1 = "| #{board[0]} | #{board[1]} | #{board[2]} |"
      row2 = "| #{board[3]} | #{board[4]} | #{board[5]} |"
      row3 = "| #{board[6]} | #{board[7]} | #{board[8]} |"
      
      p "|-----------|"
      p row1
      p "|-----------|"
      p row2
      p "|-----------|"
      p row3
      p "|-----------|"
    end

    until win
      show_board(available_positions)
      @win = true
    end

  end

end

puts '|-------------------------|'
puts '|----TIC---TAC---TOE------|'
puts '|-------------------------|'
puts 'Hello, user one! You will be using X. What is your name?'
p1_name = gets
player_One = Player.new(1, p1_name)

puts 'Hello, user two! You will be using O. What is your name?'
p2_name = gets
player_Two = Player.new(2, p2_name)

game = TicTacToe.new(player_One, player_Two)