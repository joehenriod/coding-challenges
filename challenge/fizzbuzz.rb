def fizzbuzz
  (-50).upto(100) do |x|
      if x % 3 == 0 && x % 5 == 0
        puts "FizzBuzz"
      elsif x % 3 == 0
        puts "Fizz"
      elsif x % 5 == 0 
        puts "Buzz"
      else
        puts x
      end
    end
end

puts fizzbuzz
