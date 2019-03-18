# Toy Robot README

Toy Robot is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units. There are no other obstructions on the table surface. The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

The robot will be represented by a red arrow that points in the direction the robot is facing.


## Getting Started
To install and run application follow these steps.
1. Git clone or download repository
2. In the project directory run `bundle install` to install dependencies
3. To run application run `ruby lib/main.rb`
4. To run Rspec tests run `rspec spec`

## Technologies Used
  + Ruby 2.3.1

## Terminal Commands
  + PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. The origin (0,0) can be considered to be the SOUTH WEST most corner.
  + MOVE will move the toy robot one unit forward in the direction it is currently facing.
  + LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
  + REPORT will announce the X,Y and orientation of the robot.

