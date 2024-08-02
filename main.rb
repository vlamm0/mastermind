# dependencies
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/mastermind'
require_relative 'lib/codebreaker'

game = Game.new
game.mm.prompt
p game.code
p game.color_code
p game.correct?
