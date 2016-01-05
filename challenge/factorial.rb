#5! = 5 * 4 * 3 * 2 * 1 = 120

def factor(n)

  fac_array = []

  while n != 0
    fac_array << n
    n = (n -1)
  end

fac_array.inject(:*)


end


puts factor(5)