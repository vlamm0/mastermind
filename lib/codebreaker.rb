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

  def go(feedback)
    colorboard
    self.guess = (cpu ? cpu_crack(feedback) : enter_code)
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
    self.options = options.select { |option| give_response(guess, option.split('')) == feedback }
    options[0].split('')
  end

  # have list of possible combos
  # pass combos to the give response func as guess and using the previous guess as the code
  def data
    puts "\nCODE BREAKER CHOOSES"
    puts '****************************************************************'
    guess.each { |symb| print "#{symb}\t".colorize(NUM_TO_COLOR[symb].to_sym) }
    puts "\n****************************************************************\n"
    guess
  end
end
