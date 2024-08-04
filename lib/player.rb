# player
class Player
  attr_accessor :cpu, :feedback

  NUM_TO_COLOR = {
    '1' => 'blue',
    '2' => 'red',
    '3' => 'green',
    '4' => 'yellow',
    '5' => 'magenta',
    '6' => 'cyan'
  }.freeze

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

  def give_response(code, guess)
    tmp = guess.map(&:clone)
    red = handle_red(code, tmp).length
    white = handle_white(code, tmp).length - red
    [red, white]
  end

  def handle_red(code, tmp)
    red = []
    code.each_with_index { |digit, i| red.push(true) if digit == tmp[i] }
    red
  end

  def handle_white(code, tmp)
    white = []
    count_only_once(code, tmp, white)
  end

  # counts number of unique color similarities between guess and actual code
  def count_only_once(code, tmp, white)
    code.each do |digit|
      next unless tmp.include?(digit)

      white.push(true)
      index = tmp.index(digit)
      tmp.delete_at(index)
    end
    white
  end
end
