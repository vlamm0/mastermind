# game
class Game
  attr_accessor :code, :mm, :turn, :cb

  NUM_TO_COLOR = {
    '1' => 'blue',
    '2' => 'red',
    '3' => 'green',
    '4' => 'yellow',
    '5' => 'purple',
    '6' => 'orange'
  }.freeze

  def initialize
    puts "***MASTER MIND***\n\n"
    self.mm = MasterMind.new
    self.cb = CodeBreaker.new
    self.code = mm.make_code
    self.turn = 0
  end

  def color_code(combo = code)
    combo.reduce([]) { |colors, digit| colors.push(NUM_TO_COLOR[digit]) }
  end

  # def start
  #   puts "***MASTER MIND***\n\n"
  # end
  def correct?
    color_code(cb.guess) == color_code
  end
end
