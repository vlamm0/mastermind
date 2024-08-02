# game
class Game
  attr_accessor :code, :mm, :turn, :cb

  NUM_TO_COLOR = {
    '1' => 'blue',
    '2' => 'red',
    '3' => 'green',
    '4' => 'yellow',
    '5' => 'magenta',
    '6' => 'cyan'
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

  def cb_turn
    puts cb.prompt
    colorboard
    # validate
    correct? ? true : false # else go to other turn not false
  end

  # display the six choosable numbers color coated
  def colorboard
    puts "Choose 4 of the following numbers:\n"
    symbs = vals_and_symbs
    symbs.each_with_index { |symb, index| print "#{index + 1}\t".colorize(symb) }
    puts
    # cb.guess
  end

  def vals_and_symbs(list = NUM_TO_COLOR.values)
    list.map { |vals| vals.to_sym }
  end
end
