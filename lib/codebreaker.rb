# codebreaker
class CodeBreaker < Player
  attr_accessor :guess, :options

  TYPE = 'Code_Breaker'.freeze
  def initialize(bool)
    super()
    self.cpu = bool
    self.guess = []
    puts "#{TYPE} will decode"
    # if bool then we will exe a function that generates a list of 1296 possible codes
    self.options = possible_codes if bool
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
  def go(feedback)
    puts prompt
    puts "***MM FEEDBACK #{feedback}"
    colorboard
    # if player
    self.guess = (cpu ? cpu_crack(feedback) : enter_code)
    puts "The guess at self is #{guess}"
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
    if feedback == false
      cpu_make_code
    else
      filter_possible_codes(feedback)
    end
  end

  def possible_codes
    option = []
    (1111..6666).each do |code|
      option.push(code.to_s) if code.to_s.split('').all? { |digit| digit.to_i.between?(1, 6) }
    end
    option
  end

  def filter_possible_codes(feedback)
    p options
    # tmp = options
    puts "$%$%$This is guess #{guess}"
    puts "& This is feedback before filter #{feedback}"
    # self.options = options.select { |option| give_response(guess, option) == feedback }
    self.options = options.select { |option| give_response(guess, option.split('')) == feedback }
    p options[0].split('')
    options[0].split('')
  end
  # have list of possible combos
  # pass combos to the give response func as guess and using the previous guess as the code
  #
end
