array_with_duplicates = [1,2,2,2,3,4,5,5,5,6,7]
cleaned_array = []
garbage = []

array_with_duplicates.each do |x|
  if cleaned_array.include?(x)
    garbage << x
  else
    cleaned_array << x
  end
end

print cleaned_array, garbage
