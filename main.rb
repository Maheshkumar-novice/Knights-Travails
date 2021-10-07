#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'knight'
require_relative 'color'

include Color

knight = Knight.new

def print_intro
  puts color_text('Welcome To Knight Travails! Find the shortest path between Start Coordinate and End Coordinate!',
                  :yellow)
  puts
  puts color_text('Enter Coordinates > (Example: 0 0)', :magenta)
end

def start_and_end_coordinates
  puts
  print color_text('Start Coordinate > ', :cyan)
  start_coordinate = gets.chomp.strip.split(' ').map(&:to_i)

  print color_text('End Coordinate > ', :cyan)
  end_coordinate = gets.chomp.strip.split(' ').map(&:to_i)
  puts
  [start_coordinate, end_coordinate]
end

def print_thanks
  puts color_text("\nThanks for playing! :)", :green)
end

print_intro
loop do
  start_coordinate, end_coordinate = start_and_end_coordinates
  knight.knight_moves(start_coordinate, end_coordinate)

  print color_text("\nWant to Stop (y/n) > ", :yellow)
  choice = gets.chomp

  break print_thanks if choice == 'y'
end
