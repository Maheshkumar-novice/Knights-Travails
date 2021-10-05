#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'knight'

# Board
class Board
  def initialize
    @knight = Knight.new
    @graph = create_graph
  end

  def create_graph
    adjacency_list = {}
    8.times do |row|
      8.times do |column|
        adjacency_list[[row, column]] = @knight.possible_moves_from_coordinate([row, column])
      end
    end
    adjacency_list
  end

  def shortest_path(start_coordinate, end_coordinate)
    queue = [start_coordinate]
    visited = []

    until queue.empty?
      move = queue.shift
      break if @graph[move].include?(end_coordinate)

      unless visited.include?(move)
        visited << move
        queue += (@graph[move])
      end
    end
  end
end

Board.new.shortest_path([3, 3], [7, 7])
