class Board
  attr_reader :cells

  WINNING_COMBOS = [ [0, 1, 2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4, 8], [2, 4, 6]].freeze

  def initialize
    @cells = (1..9).to_a
  end

  def show
    puts "{cells[0]} + {cells[1]} + {cells[2]}"
    puts "{cells[3]} + {cells[4]} + {cells[5]}"
    puts "{cells[6]} + {cells[7]} + {cells[8]}"
  end

  def update(number, symbol)
    @cells[number -1] = symbol
  end

  def valid?(number)
    cells[number - 1].is_a? Integer
  end

  def full?
    cells.all? { |cell| cell.is_a? String }
  end

  def game_over?
    WINNING_COMBOS.any? do |combo|
      cells[combo[0]] == cells[combo[1]] && cells[combo[1]] == cells[combo[2]]
    end
  end
end


class Game
  def initialize
    @board = Board.new
    @current_player = "X"
  end

  def play
    @board.show

    loop do
      puts "Player #{@current_player}: Enter a number between 1 and 9 to make your move"
      number = gets.chomp.to_i

      if @board.valid?(number)
        @board.update(number, @current_player)
        @board.show
        if @board.game_over?
          puts "Player #{@current_player} wins!"
          break
        elsif @board.full?
          puts "It's a tie!"
          break
        end
        @current_player = @current_player == "X" ? "O" : "X"
      else
        puts "Invalid move. Please try again."
      end
    end
  end
end

game = Game.new
game.play
