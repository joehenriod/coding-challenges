# Why did the chicken cross the road?
# Gb trg gb gur bgure fvqr!


def rot13(n)
  return n.tr("abcdefghijklmnopqrstuvwxyz","nopqrstuvwxyzabcdefghijklm")
end

puts rot13("joe")


puts rot13("wbr")

def rot13_2(value)
  return value.tr("a-z","n-za-m")
end

puts rot13_2("joe")

puts rot13_2("wbr")

def rot13_3(n)
  arry = ["n-za-m"]

  arry.each_with_index {|n, index|
    next_element = arry[index + 1]
    return next_element
  }
end

puts rot13_3("a")