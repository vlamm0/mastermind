# mastermind
class MasterMind < Player
  TYPE = 'Master_Mind'.freeze
  attr_accessor :feedback

  # I can default cpu to true, get rid of player cpu init, and pass only true value
  def initialize(bool)
    super()
    self.cpu = bool
    self.feedback = false
    puts "#{TYPE} will encode"
    # prompt
    # perhaps self.cpu implemented in Player class
    # self.cpu = sets if mastermind is real or not
  end

  def prompt
    puts "#{super(TYPE)}. What to do?"
  end
  # ******HUGE EDIT TO CODE BASE*****
  # RED if in the correct spot and correct color
  # WHITE if just correct color
  # def give_response(code, guess)
  #   red = handle_red(code, guess).length
  #   white = handle_white(code, guess).length - red
  #   # return these
  #   puts "CORRECT: #{red}".colorize(:red)
  #   puts "COLOR: #{white}"
  #   self.feedback = [red, white]
  # end

  # def handle_red(code, guess)
  #   red = []
  #   code.each_with_index { |digit, i| red.push(true) if digit == guess[i] }
  #   red
  # end

  # def handle_white(code, guess)
  #   white = []
  #   count_only_once(code, guess, white)
  # end

  # # counts number of unique color similarities between guess and actual code
  # def count_only_once(code, guess, white)
  #   code.each do |digit|
  #     next unless guess.include?(digit)

  #     white.push(true)
  #     index = guess.index(digit)
  #     guess.delete_at(index)
  #   end
  #   white
  # end
end
