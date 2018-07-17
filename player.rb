require_relative 'game'
require_relative 'boardcase'
require_relative 'board'

class Player
  attr_accessor :name, :symbol, :played_cases

  @@symbols = []

  def initialize
    @played_cases = []
      if @@symbols.size == 0
    puts "Player 1: what's your name ?"
    @name = gets.chomp
    while !%w(X O).include?(@symbol) do
      puts "Choose a symbol (X or O)"
      @symbol = gets.chomp.to_s.upcase
    end
    puts "player 1 symbol: #{@symbol}"
    @@symbols << @symbol
      else
      puts "Player 2: what's your name ?"
      @name = gets.chomp
      @symbol = (%w(X O) - @@symbols)[0]
      puts "player 2 symbol: #{@symbol}"
    end
  end
end
