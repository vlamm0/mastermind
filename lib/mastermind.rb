# mastermind
class MasterMind < Player
  TYPE = 'Master_Mind'.freeze

  def initialize
    super
    puts "#{TYPE} will encode"
    # prompt
    # perhaps self.cpu implemented in Player class
    # self.cpu = sets if mastermind is real or not
  end

  def make_code
    Array.new(4) { rand(1..6).to_s }
  end

  def prompt
    puts "#{super(TYPE)}. What to do?"
  end

  # RED if in the correct spot and correct color
  # WHITE if just correct color
  def give_response(code, guess)
    red = handle_red(code, guess)
    white = handle_white(code, guess)
    puts "CORRECT: #{red.length}".colorize(:red)
    puts "COLOR: #{white.length - red.length}"
  end

  def handle_red(code, guess)
    red = []
    code.each_with_index { |digit, i| red.push(true) if digit == guess[i] }
    red
  end

  def handle_white(code, guess)
    white = []
    count_only_once(code, guess, white)
  end

  # counts number of unique color similarities between guess and actual code
  def count_only_once(code, guess, white)
    code.each do |digit|
      next unless guess.include?(digit)

      white.push(true)
      index = guess.index(digit)
      guess.delete_at(index)
    end
    white
  end
end
