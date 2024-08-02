# codebreaker
class CodeBreaker < Player
  TYPE = 'Code_Breaker'.freeze
  def initialize
    super
    puts "#{TYPE} will decode"
    # prompt
  end

  def prompt
    super(TYPE)
  end

  def guess
    guesses = gets.chomp.split('')
    validate(guesses)
  end

  def validate(guesses)
    return guesses if guesses.length == 4 && guesses.all? { |guess| guess.to_i <= 6 && guess.to_i >= 1 }

    puts '***INVALID RESPONSE PICK 4 NUMBERS (NO SPACES/COMMAS)'
    guess
  end
end
