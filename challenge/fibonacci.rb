fib(0) = 0 
fib(1) = 1 
fib(n) = fib(n-1) + fib(n-2)

require 'minitest/autorun'


module Fibonacci
  def iterative_fib(number)

  

  end

  def recursive_fib(number)

  end

end



class TestFibonacci < MiniTest::Unit::TestCase

  def TestFib
    assert Fibonacci.iterative_fib(9) == 34
  end

  def TestFib
    assert ! Fibonacci.iterative_fib(6) == 5
  end

  def TestFib2
    assert Fibonacci.recursive_fib(8) == 21

  def TestFib2
    assert ! Fibonacci.recursive_fib(1) == 0
  end

  

end