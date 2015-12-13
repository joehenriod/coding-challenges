fib(0) = 0 
fib(1) = 1 
fib(n) = fib(n-1) + fib(n-2)

require 'minitest/autorun'


module Fibonacci
  def fib(number)

  

  end

end



class TestFibonacci < MiniTest::Unit::TestCase

  def test_luhn_valid
    assert Fibonacci.fib(9) == 34
  end

  def test_luhn_invalid
    assert ! Fibonacci.fib(6) == 5
  end

  def test_luhn_valid2
    assert Fibonacci.fib(8) == 21

  def test_luhn_invalid2
    assert ! Fibonacci.fib(1) == 0
  end

  

end