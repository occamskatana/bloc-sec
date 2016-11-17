require 'benchmark'
@i 
@r
def fib(n)
   if (n == 0)
     return 0
   elsif (n == 1)
     return 1
   else
     return fib(n-1) + fib(n-2)
   end
 end

def i_fib(n)
  fib_0 = 0
  fib_1 = 1

  for i in 0...n
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_1
  end

  return fib_1
end

Benchmark.bm(5) do |x|
  x.report("Recursive"){fib(20)}
  x.report("Iterative"){i_fib(20)}
end