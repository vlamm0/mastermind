# mastermind
class MasterMind < Player
  TYPE = 'Master_Mind'.freeze

  def initialize
    super
    prompt
    #   super
    #   self.code = make_code
  end

  def make_code
    [1, 2, 3, 4, 5, 6]
  end

  def prompt
    super(TYPE)
  end
end
