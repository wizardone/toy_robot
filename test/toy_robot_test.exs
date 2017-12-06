defmodule ToyRobotTest do
  use ExUnit.Case
  doctest ToyRobot

  test "greets the world" do
    assert ToyRobot.hello() == :world
  end

  test "place command" do
    assert ToyRobot.place(1, 3, :south) == %ToyRobot{facing: :south, position: [1, 3]}
  end
end
