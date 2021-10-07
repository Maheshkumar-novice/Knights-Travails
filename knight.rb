#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'board'
require_relative 'color'

# Knight
class Knight
  include Color

  def initialize
    @moves = [[2, 1], [2, -1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [1, -2], [-1, -2]]
    @min_coordinate = 0
    @max_coordinate = 7
    @board = Board.new(self)
  end

  def possible_moves_from_coordinate(coordinate)
    possible_moves = []
    @moves.each do |move|
      possible_x_coordinate = coordinate[0] + move[0]
      possible_y_coordinate = coordinate[1] + move[1]
      possible_coordinate = [possible_x_coordinate, possible_y_coordinate]
      next unless valid_move?(possible_coordinate)

      possible_moves << possible_coordinate
    end
    possible_moves
  end

  def knight_moves(start_coordinate, end_coordinate)
    print_shortest_path(@board.find_shortest_path(start_coordinate, end_coordinate))
  end

  private

  def valid_move?(coordinate)
    coordinate.all? { |value| value.between?(@min_coordinate, @max_coordinate) }
  end

  def print_shortest_path(path)
    path.freeze
    puts path.map { |node| color_text("[#{node[0]}, #{node[1]}]", :magenta) }.join(color_text(' -> ', :red))
  end
end
