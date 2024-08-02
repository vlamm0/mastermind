# codebreaker
class CodeBreaker < Player
  TYPE = 'Code_Breaker'.freeze
  def initialize
    super
    prompt
  end

  def prompt
    super(TYPE)
  end
end
