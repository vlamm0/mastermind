# game
class Game
  attr_accessor :code, :mm, :turn, :cb, :guess

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
    self.guess = ''
  end

  def color_code(combo = code)
    combo.reduce([]) { |colors, digit| colors.push(NUM_TO_COLOR[digit]) }
  end

  def correct?
    self.guess = cb.guess
    color_code(guess) == color_code
  end

  def cb_turn
    puts cb.prompt
    colorboard
    correct? ? win : update_turn # I think it is trying to return mm_turn and
  end

  # display the six choosable numbers color coated
  def colorboard
    puts "Choose 4 of the following numbers:\n"
    symbs = vals_and_symbs
    symbs.each_with_index { |symb, index| print "#{index + 1}\t".colorize(symb) }
    puts
  end

  def vals_and_symbs(list = NUM_TO_COLOR.values)
    list.map(&:to_sym)
  end

  # it is possible we do not need a turn variable if this switches users
  def update_turn
    self.turn += 1
    if self.turn > 22
      lose
    else
      turn.even? ? cb_turn : mm_turn
    end
  end

  def mm_turn
    # self.turn += 1
    puts mm.prompt
    # ***I WANT TO DISPLAY NUMBERS IN COLOR
    # p vals_and_symbs(guess)
    puts '****************************************************************'
    guess.each { |symb| print "#{symb}\t".colorize(NUM_TO_COLOR[symb].to_sym) }
    puts "\n****************************************************************"
    puts
    mm.give_response(code, guess)
    update_turn
  end

  def win
    puts '***YOU WIN****'
    puts guess
  end

  def lose
    puts '***YOU LOSE****'
    puts code
  end
end
