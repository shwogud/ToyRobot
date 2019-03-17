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

require 'rainbow'

class Table
  attr_accessor :table
  def initialize
    @table = Array.new(5) { Array.new(5, 'x') }
  end

  #user inputs (col, row) --> 
  def add_robot(pos)
    table_col = pos[0]
    table_row = pos[1]
    @table[table_row][table_col] = 'R'

  end

  def remove_robot(pos)
    table_col = pos[0]
    table_row = pos[1]
    @table[table_row][table_col] = 'x'
  end

  def render

    @table.each do |row|
      p row 
    end
  end



  #positions will be given as (row, col) 
  def switch_row_col(pos)
    pos[0], pos[1] = pos[1], pos[0]
  end
  
end 

