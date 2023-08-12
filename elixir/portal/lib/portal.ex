defmodule Portal do
  defstruct [:left, :right]

  def transfer(left, right, data) do 
    for item <- data do 
      Portal.Door.push(left, item)
    end

    %Portal{left: left, right: right}
  end

  def push_right(portal) do 
    case Portal.Door.pop(portal.left) do 
      :error -> :ok 
      {:ok, h} -> Portal.Door.push(portal.right, h)
    end

    portal
  end
end
