# game
class Game
  attr_accessor :code, :mm, :turn, :cb

  def initialize
    puts "***MASTER MIND***\n\n"
    self.mm = MasterMind.new
    self.cb = CodeBreaker.new
    self.code = mm.make_code
    self.turn = 0
  end

  # def start
  #   puts "***MASTER MIND***\n\n"
  # end
end
