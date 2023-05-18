defmodule Chapter12 do
  def hello do
    IO.puts("hello world")
    IO.gets("yes or no? ")

    {:ok, file} = File.open("path/to/file/hello", [:write])

    IO.binwrite(file, "world")

    File.close(file)

    File.read("path/to/file/hello")
  end
end
