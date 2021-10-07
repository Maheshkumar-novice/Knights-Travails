#!/usr/bin/env ruby
# frozen_string_literal: true

# Board
class Board
  def initialize(chess_piece)
    @chess_piece = chess_piece
    @graph = create_board_graph
    @parent_cells = {}
    @visited_cells = []
    @path = []
    @queue = []
  end

  def create_board_graph
    adjacency_list = {}
    8.times do |row|
      8.times do |column|
        adjacency_list[[row, column]] = @chess_piece.possible_moves_from_coordinate([row, column])
      end
    end
    adjacency_list
  end

  def find_shortest_path(start_coordinate, end_coordinate)
    initialize_parent_cells_and_queue(start_coordinate)

    until @queue.empty?
      node = @queue.shift
      return [start_coordinate] if start_coordinate == end_coordinate
      return create_path(end_coordinate, node) if @graph[node].include?(end_coordinate)

      update_parent_cells(node)
      update_visited_cells_and_queue(node)
    end
    reset_variables
  end

  private

  def create_path(end_coordinate, node)
    @path = [end_coordinate, node]
    loop do
      break if @parent_cells[node].nil?

      @path << @parent_cells[node]
      node = @parent_cells[node]
    end
    @path.reverse
  end

  def initialize_parent_cells_and_queue(start_coordinate)
    @queue = [start_coordinate]
    @parent_cells[start_coordinate] = nil
  end

  def update_parent_cells(node)
    @graph[node].each do |child|
      @parent_cells[child] = node unless @visited_cells.include?(child)
    end
  end

  def update_visited_cells_and_queue(node)
    return if @visited_cells.include?(node)

    @visited_cells << node
    @queue += (@graph[node])
  end

  def reset_variables
    @parent_cells = {}
    @visited_cells = []
    @path = []
    @queue = []
  end
end
