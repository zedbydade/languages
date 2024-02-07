let is_prime n =
  let max = int_of_float (Math.Sqrt( float_of_int n ))
  not ({ 2 .. max } |> Seq.filter ( fun d -> n%d = 0) |> Seq.nonempty)

let primes = [1000000 .. 1100000] |> ParallelList.filter is_prime


