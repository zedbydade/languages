def factorial(n)
  if n.zero? 
    1 
  else 
    factorial(n - 1)
  end
end

