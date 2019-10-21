require_relative "board"
require "colorize"
require_relative "cursor"
require "byebug"

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    color = nil
    if self.cursor.selected == self.cursor.cursor_pos
      color = :red 
    else
      color = :blue
    end
    cursor_pos = self.cursor.cursor_pos
    # self.board[cursor_pos].symbol.to_s.colorize(:blue)
    self.board.grid.each_with_index do |row, row_idx|
      if cursor_pos[0] == row_idx
        if cursor_pos[1] == 0
          puts row[0...cursor_pos[1]].join(" ") + "#{self.board[cursor_pos]} ".colorize(color) + row[cursor_pos[1]+1..-1].join(" ") 
        else 
          puts row[0...cursor_pos[1]].join(" ") + " #{self.board[cursor_pos]} ".colorize(color) + row[cursor_pos[1]+1..-1].join(" ") 
        end
      else
        puts row.join(" ")
      end
    end
  end

  def play
    b = false
    until b
      system("clear")
      self.render
      self.cursor.get_input
    end
  end

end

d = Display.new(Board.new)
d.play