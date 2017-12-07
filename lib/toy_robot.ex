defmodule ToyRobot do
  defstruct [position: [], facing: :north]
  def hello do
    :world
  end

  def place(x, y, facing) do
    %ToyRobot{position: [x, y], facing: facing}
  end

  def move do

  end

  def left do

  end

  def right do

  end

  def report(%ToyRobot{position: [x, y], facing: facing} = robot) do
    {x, y, facing}
  end
end
