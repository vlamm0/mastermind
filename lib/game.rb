# game
class Game
  attr_accessor :code, :mm, :turn, :cb

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
    code == cb.guess
  end

  def cb_turn
    puts "\nTURNS LEFT:  #{(24 - turn) / 2}"
    cb.go(mm.feedback)
    correct? ? win : update_turn
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
    testdrive = cb.data
    mm.feedback = mm.give_response(code, testdrive)
    mm.display_feedback
    update_turn
  end

  def win
    puts '***YOU WIN****'
    puts cb.data
  end

  def lose
    puts '***YOU LOSE****'
    puts code
  end
end
