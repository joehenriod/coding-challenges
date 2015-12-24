# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

#Why can't I figure out how to get a method inside another method?

def collatz(n)
  coll_arr = []
  while coll_arr.last != 1
    if n.even?
      coll_arr << (n/2)
    elsif n.odd?
      coll_arr << ((n * 3) + 1)
    end
    n = coll_arr.last
  end
  coll_arr.length
end



def counter
  num = (1..100).to_a
  calculated_values = []

  num.each_with_index do |n, index|
   calculated_values << collatz(n)
  end

return calculated_values.max
end


puts counter

