# codebreaker
class CodeBreaker < Player
  attr_accessor :guess, :options

  TYPE = 'Code_Breaker'.freeze
  def initialize(bool)
    super()
    self.cpu = bool
    self.guess = []
    puts "#{TYPE} will decode\n"
    self.options = possible_codes if bool
  end

  # manages codebreakers turn
  def go(feedback)
    colorboard
    self.guess = (cpu ? cpu_crack(feedback) : enter_code)
  end

  # displays a list of posible digits to choose from
  def colorboard
    puts "Choose 4 of the following numbers:\n"
    symbs = NUM_TO_COLOR.values.map(&:to_sym)
    symbs.each_with_index { |symb, index| print "#{index + 1}\t".colorize(symb) }
    puts
  end

  # gives random code or the first possible code given feedback from mastermind
  def cpu_crack(feedback)
    if feedback == false
      cpu_make_code
    else
      filter_possible_codes(feedback)
    end
  end

  # list of possible combinations 1111-6666 for initial options
  def possible_codes
    option = []
    (1111..6666).each do |code|
      option.push(code.to_s) if code.to_s.split('').all? { |digit| digit.to_i.between?(1, 6) }
    end
    option
  end

  # have list of possible combos
  # pass combos to the give response func as guess and using the previous guess as the code
  def filter_possible_codes(feedback)
    self.options = options.select { |option| give_response(guess, option.split('')) == feedback }
    options[0].split('')
  end

  # displays and retrieves codebreaker's guess
  def data
    puts "\nCODE BREAKER CHOOSES"
    puts '****************************************************************'
    guess.each { |symb| print "#{symb}\t".colorize(NUM_TO_COLOR[symb].to_sym) }
    puts "\n****************************************************************\n"
    guess
  end
end
