public
def recursive_fib(n)  
  #base case
    fibzero = 1
    if n == 0
      fibn = fibzero
      return fibn
    end 
    if n == 1
      fibn = recursive_fib(0)
      return fibn 
    end   
    if n == 2
      fibn = recursive_fib(1) + (n-1) # = 2
      return fibn
    end 
    if n == 3
      fibn = recursive_fib(2) + (n-2) # = 3
      return fibn
    else
      fibn = recursive_fib(n-1) + recursive_fib(n-2)
      return fibn
    end 
    
end

def iterative_fib(n)
  fib   = []
  fibzero = 1
  fib1  = 1
  fib << fibzero
  fib << fib1
  #fibnext = @fib[0] + @fib[1]
  #fib << fibnext
  fib.each_index do |i|
    if i == 0
      fibnext = fib[0]
    end
    if i != 0 and i < n 
      fibnext = fib[i-1] + fib[i]
      fib << fibnext
    end
  end
  #puts "The #{n}th Fibonacci number is #{fib.last}"
end 
  
puts iterative_fib(9)
 
# initializing variable "fibnth"
#fibnth = 0
# puts "Which nth number in the Fibonacci sequence would you like the value for?"
# n = $stdin.gets.chomp.to_i
# fibnth.recursive_fib(n)
# puts "The #{n}th Fibonacci number is #{fibnth.recursive_fib(n)}."
# fibnth.iterative_fib(n)

require 'benchmark'
  num = 35
  Benchmark.bm do |x|
    x.report("recursive_fib") { recursive_fib(num) }
    x.report("iterative_fib")  { iterative_fib(num)  }
  end
    