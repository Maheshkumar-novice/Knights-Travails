#!/usr/bin/env ruby
# frozen_string_literal: true

# Knight
class Knight
  def initialize
    @moves = [[2, 1], [2, -1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [1, -2], [-1, -2]]
    @min_coordinate = 0
    @max_coordinate = 7
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
    possible_moves.sort_by! { |a, b| a <=> b }
  end

  private

  def valid_move?(coordinate)
    coordinate.all? { |value| value.between?(@min_coordinate, @max_coordinate) }
  end
end
