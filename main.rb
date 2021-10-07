#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'knight'

knight = Knight.new
knight.knight_moves([0, 0], [7, 7])
knight.knight_moves([0, 0], [0, 0])
knight.knight_moves([3, 3], [4, 3])
knight.knight_moves([0, 0], [1, 2])
knight.knight_moves([0, 0], [3, 3])
knight.knight_moves([3, 3], [0, 0])
knight.knight_moves([0, 2], [7, 7])
