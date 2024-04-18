class BoardCase
  attr_accessor :value, :number

  def initialize(number)
    @value = " "
    @number = number
  end
end

class Board
  attr_accessor :cases

  def initialize
    @cases = {}
    (1..9).each { |num| @cases[num] = BoardCase.new(num) }
  end

  def play_turn(player)
    print "#{player.name}, choisissez une case (A1 à C3) : "
    choice = gets.chomp.upcase
    if ("A".."C").include?(choice[0]) && ("1".."3").include?(choice[1]) && cases[convert_position(choice)].value == " "
      cases[convert_position(choice)].value = player.symbol
    else
      puts "Case invalide ou déjà occupée. Veuillez réessayer."
      play_turn(player)
    end
  end

  def display
    puts "\nPlateau de jeu :"
    puts "    1  2  3 "
    puts "  -----------"
    ("A".."C").each do |row|
      print "#{row} |"
      (1..3).each do |col|
        print " #{cases[col + (row.ord - 'A'.ord) * 3].value} |"
      end
      puts "\n  -----------"
    end
  end

  def convert_position(position)
    row = position[0].ord - 'A'.ord
    col = position[1].to_i - 1
    row * 3 + col + 1
  end

  def victory?
    lines = [
      [cases[1].value, cases[2].value, cases[3].value],
      [cases[4].value, cases[5].value, cases[6].value],
      [cases[7].value, cases[8].value, cases[9].value],
      [cases[1].value, cases[4].value, cases[7].value],
      [cases[2].value, cases[5].value, cases[8].value],
      [cases[3].value, cases[6].value, cases[9].value],
      [cases[1].value, cases[5].value, cases[9].value],
      [cases[3].value, cases[5].value, cases[7].value]
    ]
    lines.any? { |line| line.uniq.size == 1 && line[0] != " " }
  end

  def full?
    cases.none? { |_, case_obj| case_obj.value == " " }
  end
end

class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

class Game
  attr_accessor :current_player, :status, :board, :players

  def initialize
    @players = []
    puts "Entrez le nom du joueur 1 : "
    player1_name = gets.chomp
    @players << Player.new(player1_name, "X")
    puts "Entrez le nom du joueur 2 : "
    player2_name = gets.chomp
    @players << Player.new(player2_name, "O")
    @board = Board.new
    @current_player = @players[0]
    @status = "en cours"
  end

  def turn
    clear_screen
    @board.display
    @board.play_turn(@current_player)
    if @board.victory?
      @status = @current_player.name
    elsif @board.full?
      @status = "match nul"
    else
      @current_player = (@current_player == @players[0]) ? @players[1] : @players[0]
      turn
    end
  end

  def game_end
    if @status == "match nul"
      puts "Match nul !"
    else
      puts "Bravo, #{@status} a gagné !"
    end
  end

  private

  def clear_screen
    system "clear" or system "cls"
  end
end

class Show
  def show_board(board)
    board.display
  end
end

class Application
  def perform
    game = Game.new
    show = Show.new
    while game.status == "en cours"
      game.turn
    end
    game.game_end
  end
end

Application.new.perform
