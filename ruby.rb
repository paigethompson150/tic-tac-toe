#class storing instance vars name and an array of positions
#if class contakns x,x,x, they win.
# set var for win set to false
#while win is false
#grid sjhoulf  d be an array odf positions so we can replace a 
#fixed posv w/ x or o
require 'colorize'

class Player
  attr_reader :name

  def initialize(player_number, name)
    @player_number = player_number
    @name = name
  end
end

class TicTacToe

  WIN_COMBOS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  attr_accessor :board_positions, :win, :winner
  attr_reader :p1, :p2

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
    
    #array storing positions that are available for player to choose
    available_positions = [1,2,3,4,5,6,7,8,9]
    #keeps track of player turn (0 is p1, 1 is p2)
    turn_tracker = 0;
    
    def show_board(board)
      #displays the board to the screen
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


    def make_choice(available_positions, turn_tracker)
      if turn_tracker == 0
        p "#{@p1.name.chomp}, what is your choice?"
        choice = gets

        if available_positions.index(choice.chomp.to_i)
          available_positions[(choice.to_i)-1] = 'X'
        else
          p 'That position is already taken, or is not 1-9! Try again.'
          make_choice(available_positions, turn_tracker)
        end

      else
        p "#{@p2.name.chomp}, what is your choice?"
        choice = gets
        if available_positions.index(choice.chomp.to_i)
          available_positions[(choice.to_i)-1] = 'O'
        else
          p 'That position is already taken or is not 1-9! Try again.'
          make_choice(available_positions, turn_tracker)
        end
      end
    end

    def check_win(board)
      board.each_with_index do |val, index|
        WIN_COMBOS.each do |first, second, third|

          if (board[first] == board[second]) && (board[second] == board[third])
           return true
          else
          end

        end
      end
    end

    def announce_winner(winner)
      puts "Congratulions, #{winner}! You have won the match.".red
    end

    until win
      show_board(available_positions)
      if turn_tracker == 0
        make_choice(available_positions, turn_tracker)
        if check_win(available_positions) == true 
          @win = true
          @winner = @p1.name.chomp
          announce_winner(@winner)
        end
        turn_tracker = 1
      else
        make_choice(available_positions, turn_tracker)
        if check_win(available_positions) == true 
          @win = true
          @winner = @p2.name.chomp
          announce_winner(@winner)
        end
        turn_tracker = 0
      end
      
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