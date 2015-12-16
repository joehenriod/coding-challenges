def recursive_fib(n)

  @a = 0
  @b = 1

  (1).upto(n) do

  sum = @a + @b
  @a = @b
  @b = sum
  puts @a
    
  end



end

#recursive_fib(10)


def interative_fib(n)
  starting_array = [0,1]

  first_operation = starting_array.reverse

  puts first_operation

end

interative_fib(1)