#Initialize the table, and places the robot onto the page.

# (col, row) ====> (1, 2) wll be at the spot marked R

# PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT Output: 3,3,NORTH 
#The end is marked with an E


          
#    <--- col ---->

# 4  x  x  x  x  x
# 3  x  x  x  E  x
# 2  x  R  x  x  x
# 1  x  x  x  x  x
# 0  x  x  x  x  x
#    0  1  2  3  4

require 'colorize'

class Table
  ROBOT_SYMBOLS = { 
    "north" => "↑", 
    "south" => "↓", 
    "east" => "→", 
    "west" => "←" 
  }

  attr_accessor :table
  def initialize
    @table = Array.new(5) { Array.new(5, '·') }
  end

  #user inputs (col, row) --> 
  def add_robot(pos, dir)
    table_col, table_row = pos
    @table[table_row][table_col] = ROBOT_SYMBOLS[dir].colorize(:red)
  end

  def remove_robot(pos)
    table_col, table_row = pos
    @table[table_row][table_col] = '·'
  end

  def render
    @table.each_with_index do |row, idx|
      print "#{4 - idx} ".colorize(:light_blue)
      row.each do |el|
        print "| #{el} "
      end
      print "|"
      puts
    end

    print "    0   1   2   3   4".colorize(:light_blue)
    puts
  end
end 

