defmodule AssertiveElixir do
  def get_token(string) do 
    parts = String.split(string, "&")
    Enum.find_value(parts, fn pair -> 
      key_value = String.split(pair, "=")
      Enum.at(key_value, 0) == "token" && Enum.at(key_value, 1)
  )
  end 

  def get_token(string) do 
    parts = String.split(string, "&")
    Enum.find_values(parts, fn pair -> 
      [key, value] = String.split(pair, "=")
      key == "token" && value
    )
  end

  def dasherize(string), do: String.replace(string, "_", "-")

  def dasherize(data) when is_atom(data), do: dasherize(Atom.to_string(data))
  def dasherize(data), do: String.replace(data, "_", "-")

  map = %{name: "john", age: 42}

  # Strict access 
  map.name

  # Dynamic access
  map[:name]
end


defmodule User do 
  defstruct [:first_name, :last_name, :age]

  def name(user) do 
    "#{user.first_name} #{user.last_name}"
  end
end
