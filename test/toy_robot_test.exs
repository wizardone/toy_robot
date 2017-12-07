defmodule ToyRobotTest do
  use ExUnit.Case
  doctest ToyRobot

  test "greets the world" do
    assert ToyRobot.hello() == :world
  end

  test "place command" do
    assert ToyRobot.place(1, 3, :south) == %ToyRobot{facing: :south, position: [1, 3]}
  end

  test "report command" do
    robot = ToyRobot.place(1, 3, :north)
    assert ToyRobot.report(robot) == {1, 3, :north}
  end

  test "left command" do
    robot = ToyRobot.place(2, 2, :north)
    assert ToyRobot.left(robot) == %ToyRobot{facing: :west, position: [2, 2]}
  end

  test "right command" do
    robot = ToyRobot.place(2, 2, :north)
    assert ToyRobot.right(robot) == %ToyRobot{facing: :east, position: [2, 2]}
  end
end
