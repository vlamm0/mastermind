# dependencies
require 'colorize'
require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/mastermind'
require_relative 'lib/codebreaker'

game = Game.new
puts
p game.cb_turn
