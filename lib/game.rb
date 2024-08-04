# game
class Game
  attr_accessor :code, :mm, :turn, :cb

  def initialize
    self.mm, self.cb, self.turn = player_init
    self.code = mm.cpu ? mm.cpu_make_code : mm.enter_code # logic to decide what the code is mm.make_code
    cb_turn
  end

  # helps initialize mastermind, codebreaker, and the turn
  def player_init
    puts "***LET'S PLAY MASTERMIND***\n\n"
    select = select_screen
    [MasterMind.new(select[1]), CodeBreaker.new(select[0]), 0]
  end

  # allows user to choose mastermind or codebreaker
  def select_screen
    puts 'Press 1 for Master_Mind and 2 for Code_Breaker'
    select = gets.chomp
    select_screen if select != '1' && select != '2'
    select == '1' ? [true, false] : [false, true]
  end

  def correct?
    code == cb.guess
  end

  # handles codebreaker turn
  def cb_turn
    puts "\nTURNS LEFT:  #{(24 - turn) / 2}"
    cb.go(mm.feedback)
    correct? ? win(cb.cpu) : update_turn
  end

  # updates turn# and switches between codebreaker and mastermind turns
  def update_turn
    self.turn += 1
    if self.turn > 22
      lose
    else
      turn.even? ? cb_turn : mm_turn
    end
  end

  # handles mastermind's turn
  def mm_turn
    mm.feedback = mm.give_response(code, cb.data)
    mm.display_feedback
    update_turn
  end

  def win(cpu)
    puts cpu ? '***YOU LOSE***' : '***YOU WIN***'
    puts cb.data
  end

  def lose
    puts '***YOU LOSE****'
    puts code
  end
end
