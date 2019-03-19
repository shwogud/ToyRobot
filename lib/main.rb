require_relative 'table'
require_relative 'robot'
require 'set'

class Main
  attr_accessor :table, :robot
  def initialize
    @table = Table.new
    @robot = Robot.new
  end

  def instructions
    puts 'DIRECTIONS: '
    puts "PLACE should be followed by a indices and direction. ex: PLACE 1,2,EAST"
    puts "MOVE moves the robot forward by one space in its direction. ex: MOVE"
    puts "RIGHT/LEFT changes the robot's direction. ex: RIGHT"
    puts "REPORT tells the location and direction of the robot. ex: REPORT"
    puts "Your very first command must be a PLACE command"
    puts "Type 'EXIT' to exit"
  end

  def run
    self.instructions
    self.render

    #taking the first place command
    while true
      p "Please enter a command:"
      input = gets.chomp.downcase.split(/\s+/)

      if input[0] == 'exit'
        p "All Done!"
        return
      end

      if input.length == 2 && (input[0] == 'place' && @robot.valid_place_arguments?(input[1].split(",")))
        self.perform_command(input)
        self.render
        break
      else
        p "First command must be PLACE followed by valid indices and direction. ex: PLACE 1,2,EAST"
      end
    end

    #taking all other commands
    while true
      p "Please enter a command:"
      input = gets.chomp.downcase.split(/\s+/)

      if input[0] == 'exit'
        p "All Done!"
        return
      end

      #check if valid command
      if self.command_is_valid?(input)
        self.perform_command(input)
        self.render
      else
        p "Command not Valid. Try Again"
      end
    end
  end

  def command_is_valid?(input)
    if input.length == 1
      valid_commands = ['move', 'left', 'right', 'report'].to_set
      return valid_commands.include?(input[0])
    end

    if input.length == 2
      return input[0] == 'place' && @robot.valid_place_arguments(input[1].split(","))
    end

    false
  end

  def perform_command(input)
    command = input[0]
    arguments = (command == 'place') ? input[1].split(",") : nil

    self.commands(command, arguments)
  end


  def commands(command, arguments)
    
    case command 
      when 'place'
        @table.remove_robot(@robot.position)
        pos = [arguments[0].to_i, (arguments[1].to_i - 4).abs]
        dir = arguments[2].downcase

        @robot.set_position(pos)
        @robot.set_direction(dir)
        @table.add_robot(pos, dir)

      when 'move'
        @table.remove_robot(@robot.position)
        @robot.move
        @table.add_robot(@robot.position, @robot.direction)

      when 'left'
        @robot.left
        @table.add_robot(@robot.position, @robot.direction)

      when 'right'
        @robot.right
        @table.add_robot(@robot.position, @robot.direction)

      when 'report'
        @robot.report
      
      else
        p 'Invalid Command'
    end
  end

  def render
    @table.render 
  end
end

m = Main.new 
m.run