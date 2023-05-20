defmodule Chapter17 do
  for n <- 1..4, do: n * n
  for {:good, n} <- values, do: n * n

  dirs = ['/home/mikey', '/home/james']

  for dir <- dirs, 
    file <- File.ls!(dir), 
    path = Path.join(dir, file), 
    File.regular?(path) do 
      File.stat!(path).size
    end
end
