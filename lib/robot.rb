

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

  def set_position(pos)
    @position = [pos[0], pos[1]]
  end

  def set_direction(direction)
    @direction = direction
  end

  def move
    if self.exist?
      first_pos, second_pos = @position
      x_direction = DIRECTION[@direction][0]
      y_direction = DIRECTION[@direction][1]
      
      if first_pos < TABLE_LENGTH && first_pos > 0
        x_coord = @position[0] + x_direction
      elsif first_pos.zero?
        x_coord = @direction == 'west' ? 0 : first_pos + x_direction
      elsif first_pos == TABLE_LENGTH
        x_coord = @direction == 'east' ? TABLE_LENGTH : first_pos + x_direction
      else
        x_coord = TABLE_LENGTH
      end

      if second_pos < TABLE_LENGTH && second_pos > 0
        y_coord = second_pos + y_direction
      elsif @position[1].zero?
        y_coord = @direction == 'north' ? 0 : second_pos + y_direction
      elsif second_pos == TABLE_LENGTH
        y_coord = @direction == 'south' ? TABLE_LENGTH : second_pos + y_direction
      else
        y_coord = TABLE_LENGTH
      end

      @position = [x_coord, y_coord]

    else 
      p 'Robot must exist on Board'
    end
  end

  def left
    changeOrientation('left');
  end

  def right
    changeOrientation('right');
  end

  def changeOrientation(dir)
    if dir == 'left'
      prev_orientation_index = ORIENTATION.index(@direction)
      curr_orientation_index = (prev_orientation_index - 1) % ORIENTATION.length
    elsif dir == 'right'
      prev_orientation_index = ORIENTATION.index(@direction)
      curr_orientation_index = (prev_orientation_index + 1) % ORIENTATION.length
    end

    @direction = ORIENTATION[curr_orientation_index]
  end


  def report
    p @position
    p @direction
  end
end
