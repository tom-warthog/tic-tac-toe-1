require_relative 'player'
require_relative 'game'
require_relative 'boardcase'

class Board
  include Enumerable
  attr_accessor :boardcases

  def initialize
    @boardcases = []
    i = 0
    while i < 9 do
      @boardcases << BoardCase.new(i) # Création de 9 instances (= 9 boardcases)
      i += 1
    end
  end

  def display
  puts "-------------"
  puts "| #{boardcases[0].value} | #{boardcases[1].value} | #{boardcases[2].value} |"
  puts "|-----------|"
  puts "| #{boardcases[3].value} | #{boardcases[4].value} | #{boardcases[5].value} |"
  puts "|-----------|"
  puts "| #{boardcases[6].value} | #{boardcases[7].value} | #{boardcases[8].value} |"
  puts "-------------"
  puts puts "*" * 40 +" <3"
  # Affiche la grille de morpion
  end

  def victory?(played_cases, player)
    if played_cases != nil
      win_state = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
      win_state.each do |line|
        if (line & played_cases).size == 3 # Intersection entre played_cases et win_state pour déterminer s'il y a win
          puts "#{player.name} a gagné !"
          return true
        end
      end
      return false
    end
  end
end
