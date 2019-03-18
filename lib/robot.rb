

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

  #takes a string
  def set_direction(direction)
    @direction = direction
  end

  def move
    
    if self.exist?
      if @position.first < TABLE_LENGTH && @position.first > 0
        first_pos = @position[0] + DIRECTION[@direction][0]

      elsif @position.first.zero?
        first_pos = @direction == 'west' ? 0 : @position.first + DIRECTION[@direction][0]

      elsif @position.first == TABLE_LENGTH
        first_pos = @direction == 'east' ? TABLE_LENGTH : @position.first + DIRECTION[@direction][0]

      else
        first_pos = TABLE_LENGTH
      end

      if @position.last < TABLE_LENGTH && @position.last > 0
        second_pos = @position.last + DIRECTION[@direction][1]
      elsif @position[1].zero?
        if @direction == 'north'
          second_pos = 0
        else
          second_pos = @position.last + DIRECTION[@direction][1]
        end

      elsif @position.last == TABLE_LENGTH
        if @direction == 'south'
          second_pos = TABLE_LENGTH
        else
          second_pos = @position.last + DIRECTION[@direction][1]
        end
      else
        second_pos = TABLE_LENGTH
      end

      @position = [first_pos, second_pos]

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
