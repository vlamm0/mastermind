# mastermind
class MasterMind < Player
  TYPE = 'Master_Mind'.freeze
  attr_accessor :feedback

  def initialize(bool)
    super()
    self.cpu = bool
    self.feedback = false
    puts "#{TYPE} will encode"
  end

  # displays feedback given codebreakers guess
  def display_feedback
    puts "CORRECT: #{feedback[0]}".colorize(:red)
    puts "COLOR: #{feedback[1]}"
    sleep 2 if cpu == false
  end
end
