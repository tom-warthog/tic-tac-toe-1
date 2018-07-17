require_relative 'player'
require_relative 'boardcase'
require_relative 'board'

class Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @board = Board.new
    @free_cases = (1..9).to_a
  end

  def go
    puts "Rules, enjoy!"
    puts "here is your board, just choose your case and win!"
    puts "-------------"
    puts "| 1 | 2 | 3 |"
    puts "|-----------|"
    puts "| 4 | 5 | 6 |"
    puts "|-----------|"
    puts "| 7 | 8 | 9 |"
    puts "-------------"
    puts "=" * 40

    a = [@player1, @player2]
    rand = rand(0..1)
    @board.display
    while !@board.victory?(a[rand].played_cases, a[rand]) do
      turn(a.rotate![rand])
    end
  end

  def turn(player)
    puts "A toi #{player.name}!"
    input = gets.chomp.to_i
    while !@free_cases.include?(input)
      puts "Essaye encore!"
      input = gets.chomp.to_i
    end
    @free_cases -= [input]
    @board.boardcases[input - 1].value = player.symbol
    #On remplace la valeur du boardcase " " contenu dans l'array boardcases,
    #variable de l'instance @board, par le symbole du joueur
    player.played_cases << input - 1
    @board.display
  end
end

Game.new.go
