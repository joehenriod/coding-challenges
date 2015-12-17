def recursive_fib(n)

  @a = 0
  @b = 1

  (1).upto(n-1) do

  sum = @a + @b
  @a = @b
  @b = sum
  puts @a
    
  end



end

recursive_fib(10)


def iterative_fib(n)
  
  fib_array = [0,1]

  (n-2).times do 
    

    first_operation = fib_array
    second_operation = first_operation[-1] + first_operation[-2]
    fib_array << second_operation

    


      
  end

  return fib_array.last

end

puts iterative_fib(10)