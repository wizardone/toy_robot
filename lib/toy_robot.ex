defmodule ToyRobot do
  defstruct [position: [], facing: :north]

  @max_x 4
  @max_y 4

  def place(x, y, facing) when x <= @max_x and x >= 0 and y <= @max_y and y >= 0 do
    %ToyRobot{position: [x, y], facing: facing}
  end

  def place(x, y, _facing) when x > @max_x or x < 0 or y > @max_y or y < 0 do
    {:fail, "Invalid coordinates"}
  end

  def move(%ToyRobot{position: [x, y], facing: facing} = _robot) do
    case facing do
      :north -> place(x, y + 1, facing)
      :east  -> place(x + 1, y, facing)
      :south -> place(x, y - 1, facing)
      :west  -> place(x - 1, y, facing)
    end
  end

  def left(%ToyRobot{facing: facing} = robot) do
    %ToyRobot{robot | facing: facings(:left, facing)}
  end

  def right(%ToyRobot{facing: facing} = robot) do
    %ToyRobot{robot | facing: facings(:right, facing)}
  end

  def report(%ToyRobot{position: [x, y], facing: facing} = _robot) do
    {x, y, facing}
  end

  defp facings(direction, currently_facing) do
    facings = case direction do
      :left  -> %{north: :west, east: :north, south: :east, west: :south}
      :right -> %{north: :east, east: :south, south: :west, west: :north}
    end
    facings[currently_facing]
  end
end
