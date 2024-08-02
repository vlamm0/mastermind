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
    guess = gets.chomp
    guess.split('')
  end
end
