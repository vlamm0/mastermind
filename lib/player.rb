# player
class Player
  attr_accessor :cpu

  NUM_TO_COLOR = {
    '1' => 'blue',
    '2' => 'red',
    '3' => 'green',
    '4' => 'yellow',
    '5' => 'magenta',
    '6' => 'cyan'
  }.freeze

  def prompt(type)
    "#{type}'s turn"
  end

  def cpu_make_code
    Array.new(4) { rand(1..6).to_s }
  end

  def enter_code
    puts 'ENTER 4 DIGIT CODE 1-6'
    guesses = gets.chomp.split('')
    validate(guesses)
  end

  def validate(guesses)
    return guesses if guesses.length == 4 && guesses.all? { |guess| guess.to_i.between?(1, 6) }

    puts '***INVALID RESPONSE PICK 4 NUMBERS (NO SPACES/COMMAS)'
    enter_code
  end
end
