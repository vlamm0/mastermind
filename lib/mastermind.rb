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
  end

  def display_feedback
    puts "CORRECT: #{feedback[0]}".colorize(:red)
    puts "COLOR: #{feedback[1]}"
    sleep 2 if cpu == false
  end
end
