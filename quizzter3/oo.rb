class Dog
attr_accessor :breed, :age

	def initialize(breed, age)
		@breed = breed
		@age = age
	end

end


dog = Dog.new(:shepard, 4)

puts dog.breed