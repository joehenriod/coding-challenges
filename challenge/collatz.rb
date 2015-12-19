# n → n/2 (n is even)
# n → 3n + 1 (n is odd)



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

  num.each do |n|
  collatz(n)
  end
end

puts counter