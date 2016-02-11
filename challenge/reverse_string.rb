#Reverse a string



def reverse(str)
  str.chars.sort_by.with_index { |_, i| -i }.join
end

puts reverse("hello")