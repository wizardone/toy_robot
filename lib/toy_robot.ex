defmodule ToyRobot do
  defstruct [position: [], facing: :north]
  def hello do
    :world
  end

  def place(x, y, facing) do
    %ToyRobot{position: [x, y], facing: facing}
  end

  def move(%ToyRobot{position: [x, y], facing: facing} = _robot) do
    case facing do
      :north -> %ToyRobot{position: [x, y + 1], facing: :north}
      :east  -> %ToyRobot{position: [x + 1, y], facing: :east}
      :south -> %ToyRobot{position: [x, y - 1], facing: :south}
      :west  -> %ToyRobot{position: [x - 1, y], facing: :west}
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

  defp facings(direction, current_facing) do
    facings = case direction do
      :left  -> %{north: :west, east: :north, south: :east, west: :south}
      :right -> %{north: :east, east: :south, south: :west, west: :north}
    end
    facings[current_facing]
  end

end
