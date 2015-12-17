# n → n/2 (n is even)
# n → 3n + 1 (n is odd)



def collatz(n)

coll_arr = []

  if n == 1
    coll_arr << n 
  elsif n.even?
    coll_arr << (n/2)
  elsif n.odd?
    coll_arr << ((n * 3) + 1)
  end
    

end


puts collatz(5)