# player
class Player
  attr_accessor :cpu

  def initialize(bool)
    self.cpu = bool
  end

  def prompt(type)
    "#{type}'s turn"
  end

  def enter_code
    puts 'ENTER 4 DIGIT CODE 1-6'
    guesses = gets.chomp.split('')
    validate(guesses)
  end

  def validate(guesses)
    return guesses if guesses.length == 4 && guesses.all? { |guess| guess.to_i.between?(1, 6) }

    puts '***INVALID RESPONSE PICK 4 NUMBERS (NO SPACES/COMMAS)'
    enter_code
  end
end
