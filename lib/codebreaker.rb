# codebreaker
class CodeBreaker < Player
  attr_accessor :guess

  TYPE = 'Code_Breaker'.freeze
  def initialize(bool)
    super()
    self.cpu = bool
    self.guess = []
    puts "#{TYPE} will decode"
    # prompt
  end

  def prompt
    super(TYPE)
  end

  # could refactor guess and validate to be a player class
  # def guess
  #   guesses = gets.chomp.split('')
  #   validate(guesses)
  # end

  # def validate(guesses)
  #   return guesses if guesses.length == 4 && guesses.all? { |guess| guess.to_i <= 6 && guess.to_i >= 1 }

  #   puts '***INVALID RESPONSE PICK 4 NUMBERS (NO SPACES/COMMAS)'
  #   guess
  # end
  def go(feedback: false)
    puts prompt
    colorboard
    # if player
    self.guess = (cpu ? enter_code : cpu_crack(feedback))
    # if cpu self.guess = cpu_enter_code(feedback)
  end

  def colorboard
    puts "Choose 4 of the following numbers:\n"
    symbs = NUM_TO_COLOR.values.map(&:to_sym)
    symbs.each_with_index { |symb, index| print "#{index + 1}\t".colorize(symb) }
    puts
  end

  def cpu_crack(feedback)
    puts 'ENTER 4 DIGIT CODE 1-6'
    cpu_make_code unless feedback
  end
end
