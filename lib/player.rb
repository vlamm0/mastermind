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

  # generates a random valid code
  def cpu_make_code
    Array.new(4) { rand(1..6).to_s }
  end

  # has player enter a valid code
  def enter_code
    puts 'ENTER 4 DIGIT CODE 1-6'
    guesses = gets.chomp.split('')
    validate(guesses)
  end

  # checks that given code is valid
  def validate(guesses)
    return guesses if guesses.length == 4 && guesses.all? { |guess| guess.to_i.between?(1, 6) }

    puts '***INVALID RESPONSE PICK 4 NUMBERS (NO SPACES/COMMAS)'
    enter_code
  end

  # takes two valid codes and compares them to generate feedback
  # (what is correct in terms of position and color and what is just the correct color)
  def give_response(code, guess)
    tmp = guess.map(&:clone) # needed so self.guess is not updated (could replace guess as passed value)
    red = handle_red(code, tmp) # .length
    white = handle_white(code, tmp) - red
    [red, white]
  end

  # returns number of digits in guess with correct positioning and color
  def handle_red(code, tmp)
    red = 0 # red.push(true)
    code.each_with_index { |digit, i| red += 1 if digit == tmp[i] }
    red
  end

  # returns number of correct colored digits in guess
  def handle_white(code, tmp, sum = 0)
    code.each do |digit|
      next unless tmp.include?(digit)

      sum += 1
      tmp.delete_at(tmp.index(digit))
    end
    sum
  end
end
