defmodule ToyRobot do
  defstruct [position: [], facing: :north]
  def hello do
    :world
  end

  def place(x, y, facing) do
    %ToyRobot{position: [x, y], facing: facing}
  end

  def move(%ToyRobot{position: [x, y], facing: facing} = robot) do
    case robot do
      _ -> "kur"
    end
  end

  def left(%ToyRobot{position: [x, y], facing: facing} = robot) do
    case facing do
      :north -> %ToyRobot{position: [x, y], facing: :west}
      :east  -> %ToyRobot{position: [x, y], facing: :north}
      :south -> %ToyRobot{position: [x, y], facing: :east}
      :west  -> %ToyRobot{position: [x, y], facing: :south}
    end
  end

  def right(%ToyRobot{position: [x, y], facing: facing} = robot) do
    case facing do
      :north -> %ToyRobot{position: [x, y], facing: :east}
      :east  -> %ToyRobot{position: [x, y], facing: :south}
      :south -> %ToyRobot{position: [x, y], facing: :west}
      :west  -> %ToyRobot{position: [x, y], facing: :north}
    end
  end

  def report(%ToyRobot{position: [x, y], facing: facing} = robot) do
    {x, y, facing}
  end
end
