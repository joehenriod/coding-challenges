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


def iterative_fib(n)
  
  n.times do 
    fib_array = [0,1]

    first_operation = fib_array.reverse
    second_operation = first_operation[0] + first_operation[1]
    fib_array << second_operation.to_i


    puts fib_array
  end

end

iterative_fib(3)