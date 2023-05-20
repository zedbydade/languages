defmodule Chapter16 do
  def type(value) when is_binary(value), do: "string"
  def type(value) when is_integer(value), do: "integer"

  @spec type(t) :: String.t()
  def type(value)
end

defimpl Chapter16, for: Bitstring  do
  def type(_value), do: "string"
end

defimpl Chapter16, for: Integer  do
  def type(_value), do: "integer"
end

defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  def size(data)
end

defimpl Size, for: Bitstring  do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map  do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple  do
  def size(tuple), do: tuple_size(tuple)
end

defimpl Size, for: MapSet  do
  def size(set), do: MapSet.size(set)
end
