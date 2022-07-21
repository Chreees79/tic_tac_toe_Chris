require 'bundler'
require 'colorized_string'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/game'
require 'app/player'
require 'views/board'
require 'views/boardcase'


my_game = Game.new()
my_game.perform