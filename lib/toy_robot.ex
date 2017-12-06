defmodule ToyRobot do
  defstruct [position: [], facing: "NORTH"]
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

  def report do

  end
end
