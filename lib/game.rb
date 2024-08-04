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
    self.mm, self.cb, self.turn = player_init
    self.code = mm.cpu ? mm.cpu_make_code : mm.enter_code # logic to decide what the code is mm.make_code
    cb_turn
  end

  def player_init
    puts "***LET'S PLAY MASTERMIND***\n\n"
    select = select_screen
    [MasterMind.new(select[1]), CodeBreaker.new(select[0]), 0]
  end

  def select_screen
    puts 'Press 1 for Master_Mind and 2 for Code_Breaker'
    select = gets.chomp
    select_screen if select != '1' && select != '2'
    select == '1' ? [true, false] : [false, true]
  end

  # only good for production | delete
  def color_code(combo = code)
    combo.reduce([]) { |colors, digit| colors.push(NUM_TO_COLOR[digit]) }
  end

  # this needs to be changed to a simple self.guess == cb.enter_code
  def correct?
    puts "Guess @ game #{cb.guess}"
    code == cb.guess
    # color_code(guess) == color_code
  end

  def cb_turn
    # puts cb.prompt
    # colorboard
    cb.go(mm.feedback) #= variable pass to correct?
    correct? ? win : update_turn # I think it is trying to return mm_turn and
  end

  # display the six choosable numbers color coated
  # def colorboard
  #   puts "Choose 4 of the following numbers:\n"
  #   symbs = vals_and_symbs
  #   symbs.each_with_index { |symb, index| print "#{index + 1}\t".colorize(symb) }
  #   puts
  # end

  # def vals_and_symbs(list = NUM_TO_COLOR.values)
  #   list.map(&:to_sym)
  # end

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
    cb.guess.each { |symb| print "#{symb}\t".colorize(NUM_TO_COLOR[symb].to_sym) }
    puts "\n****************************************************************"
    puts
    puts "GUESS @ mm turn b4 #{cb.guess}"
    testdrive = cb.guess.map(&:clone)
    mm.feedback = mm.give_response(code, testdrive)
    puts "GUESS @ mm turn after #{cb.guess}"
    puts "^^^#{mm.feedback}"
    update_turn
  end

  def win
    puts '***YOU WIN****'
    puts code
  end

  def lose
    puts '***YOU LOSE****'
    puts code
  end
end
