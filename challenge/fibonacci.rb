def fib(n)

  @a = 0
  @b = 1

  (1).upto(n) do

  sum = @a + @b
  @a = @b
  @b = sum
  puts @a
    
  end



end

fib(10)