

class Robot
  TABLE_LENGTH = 4 
  DIRECTION = { 
    "north" => [0, -1], 
    "south" => [0, 1], 
    "east" => [1, 0], 
    "west" => [-1, 0] 
  }

  ORIENTATION = ["north", "east", "south", "west"]

  attr_accessor :position, :direction

  def initialize
    @position = [-1, -1]
    @direction = ""
  end

  def exist?
    #if position[0] is equal to -1, no robot has been placed on the board yet
    @position[0] != -1
  end

  def set_position(row, col)
    @position = [row, col]
  end

  #takes a string
  def set_direction(direction)
    @direction = direction
  end

  def move
    
    if self.exist?
      if @position[0] < TABLE_LENGTH && @position[0] > 0
        first_pos = @position[0] + DIRECTION[@direction][0]
      elsif @position[0] == 0
        if @direction == 'west'
          first_pos = 0
        else
          first_pos = @position[0] + DIRECTION[@direction][0]
        end

      elsif @position[0] == TABLE_LENGTH
        if @direction == 'east'
          first_pos = TABLE_LENGTH
        else
          first_pos = @position[0] + DIRECTION[@direction][0]
        end
      else
        first_pos = TABLE_LENGTH
      end

      if @position[1] < TABLE_LENGTH && @position[1] > 0
        second_pos = @position[1] + DIRECTION[@direction][1]
      elsif @position[1] == 0
        if @direction == 'north'
          second_pos = 0
        else
          second_pos = @position[1] + DIRECTION[@direction][1]
        end

      elsif @position[1] == TABLE_LENGTH
        if @direction == 'south'
          second_pos = TABLE_LENGTH
        else
          second_pos = @position[1] + DIRECTION[@direction][1]
        end
      else
        second_pos = TABLE_LENGTH
      end

      @position = [first_pos, second_pos]

    else 
      p 'Robot must exist on Board'
    end
  end


  def changeOrientation(left_or_right)
    if left_or_right == 'left'
      prev_orientation_index = ORIENTATION.index(@direction)
      curr_orientation_index = (prev_orientation_index - 1) % ORIENTATION.length
    elsif left_or_right == 'right'
      prev_orientation_index = ORIENTATION.index(@direction)
      curr_orientation_index = (prev_orientation_index + 1) % ORIENTATION.length
    end

    @direction = ORIENTATION[curr_orientation_index]
  end

  def left
    changeOrientation('left');
  end

  def right
    changeOrientation('right');
  end

  def report
    p [@position[0], @position[1]]
    p @direction
  end
end
