require './tail_call_optimization'

class Calculator
  extend TailCallOptimization

  tail_recursive def fact(n)
    return acc if n <= 1

    fact(n - 1, n * acc)
  end
end
