defmodule ToyRobotTest do
  use ExUnit.Case
  doctest ToyRobot

  test "place command" do
    assert ToyRobot.place(1, 3, :south) == %ToyRobot{facing: :south, position: [1, 3]}
  end

  test "out of table coordinates" do
    assert ToyRobot.place(4, 7, :south) == {:fail, "Invalid coordinates"}
    assert ToyRobot.place(-1, 4, :south) == {:fail, "Invalid coordinates"}
    assert ToyRobot.place(5, 5, :south) == {:fail, "Invalid coordinates"}
  end

  test "report command" do
    position = ToyRobot.place(2, 2, :north)
               |> ToyRobot.report
    assert position == {2, 2, :north}
  end

  test "left command" do
    position = ToyRobot.place(2, 2, :north)
               |> ToyRobot.left
    assert position == %ToyRobot{facing: :west, position: [2, 2]}
  end

  test "right command" do
    position = ToyRobot.place(2, 2, :north)
               |> ToyRobot.right
    assert position == %ToyRobot{facing: :east, position: [2, 2]}
  end

  test "move command" do
    position = ToyRobot.place(2, 2, :north)
               |> ToyRobot.move
    assert position == %ToyRobot{facing: :north, position: [2, 3]}
  end

  test "a whole sequence of commands" do
    position = ToyRobot.place(1, 2, :north)
               |> ToyRobot.move
               |> ToyRobot.move
               |> ToyRobot.right
               |> ToyRobot.move

    assert position == %ToyRobot{facing: :east, position: [2, 4]}
  end
end
