require_relative 'player'
require_relative 'game'
require_relative 'board'

class BoardCase
  attr_accessor :case_number, :value

  def initialize(case_number)
    @case_number = case_number
    @value = " "
  end

end
