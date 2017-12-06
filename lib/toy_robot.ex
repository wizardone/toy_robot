defmodule ToyRobot do
  defstruct [position: [], facing: "NORTH"]
  def hello do
    :world
  end

  def place do
    %ToyRobot{}
  end
end
