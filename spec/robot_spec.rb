require 'rspec'
require_relative '../lib/robot'

describe 'Robot' do 
  subject(:robot) { Robot.new }

  describe '#new' do
    it 'creates an instance of Robot' do
      expect(robot).to be_a Robot
    end
  end

  describe '#exist?' do 
    it 'checks if the robot is NOT on the board yet' do
      robot.position = [-1, -1]

      expect(robot.exist?).to be false

      robot.position = [1, 1]

      expect(robot.exist?).to be true
    end
  end

  describe '#valid_arguments?' do 
    it 'checks if user inputs valid arguments' do
      
      true_args = ["1", "2", "north"]
      expect(robot.valid_place_arguments?(true_args)).to be true

      false_args = ["1", "5", "north"]
      expect(robot.valid_place_arguments?(false_args)).to be false

      false_args1 = ["1", "2", "northy"]
      expect(robot.valid_place_arguments?(false_args1)).to be false
    end
  end

  describe '#set_position?' do 
    it 'checks if user inputs valid position arguments' do
      robot.position = [1, 2]
      robot.set_position([2, 3])

      expect(robot.position).to eq [2, 3]
    end
  end

  describe '#set_direction?' do 
    it 'checks if user inputs valid direction arguments' do
      robot.direction = 'north'
      robot.set_direction('south')

      expect(robot.direction).to eq 'south'
    end
  end

  describe '#move' do 
    it 'checks if robot moves correctly' do
      robot.position = [1, 2]
      robot.direction = 'north'

      robot.move 

      expect(robot.position).to eq [1, 1]

    end
  end

  describe '#left' do 
    it 'checks if the robot turns left' do
      robot.direction = 'north'
      robot.left 
      expect(robot.direction).to eq 'west'
    end
  end

  describe '#right' do 
    it 'checks if robot turns right' do
      robot.direction = 'north'
      robot.right 
      expect(robot.direction).to eq 'east'
    end
  end

end