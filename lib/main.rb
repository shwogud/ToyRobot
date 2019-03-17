require_relative 'table'
require_relative 'robot'
require "byebug"

class Main
  attr_accessor :table, :robot
  def initialize
    @table = Table.new
    @robot = Robot.new
  end

  def instructions
    p "PLACE should be followed by a indices and direction. ex: PLACE 1,2,EAST"
    p "MOVE moves the robot forward by one space in its direction. ex: MOVE"
    p "RIGHT/LEFT changes the robot's direction. ex: RIGHT"
    p "REPORT tells the location and direction of the robot. ex: REPORT"
    p ""
    p "Your very command must be a PLACE command"
    p "Type 'EXIT' to exit"
  end

  def run
    self.instructions
    p "Please enter a command:"
    input = gets.chomp.downcase.split(/\s+/)
    
    return 'Must start with PLACE' if input[0] != 'place'

    while input != ['exit']
      self.read_line_then_perform_command(input)
      self.render 
      self.instructions
      p "Please enter a command:"
      input = gets.chomp.downcase.split(/\s+/)
      
    end
    puts 'All Done!'
  end


  # PLACE 0,0,NORTH MOVE REPORT               Output: 0,1,NORTH
  # PLACE 0,0,NORTH LEFT REPORT               Output: 0,0,WEST
  # PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT Output: 3,3,NORTH
  def read_line_then_perform_command(input)
    arguments = nil
    command = input 
    if input.length == 1 && input[0] == 'place'
      p 'please input indices and direction. ex: 1,2,EAST'
      arguments = gets.chomp.downcase.split(",")
      command = 'place'
      
    elsif input.length == 2 && input[0] == 'place'
      arguments = input[1].downcase.split(",")
      command = 'place'

    else 
      command = input[0]
    end


    self.commands(command, arguments)
    
    # stuff = line.split(/\s+/)
    # stuff = ['PLACE', '0,0,NORTH', 'MOVE', 'REPORT']


  end

  def commands(command, arguments)
    
    case command 
      when 'place'
        @table.remove_robot(@robot.position)
        pos = [arguments[0].to_i, arguments[1].to_i]
        dir = arguments[2].downcase

        @robot.set_position(pos[0], pos[1])
        @robot.set_direction(dir)
        @table.add_robot(pos)

      when 'move'
        @table.remove_robot(@robot.position)
        @robot.move
        @table.add_robot(@robot.position)

      when 'left'
        @robot.left

      when 'right'
        @robot.right

      when 'report'
        @robot.report
      when 'exit'
        return 'All Done!'
      else
        p 'Invalid Command'
    end
  end

  def render
    @table.render 
  end


end

m = Main.new 
m.render
m.run 