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
end
