class Image

attr_accessor :array

	def initialize(array)
		@array = array
	end

	def output_image
		
		# Loop over each row array.
		@array.each do |x|

	    # Loop over each cell in the row.
	    x.each do |cell|
		print cell
	    end

	    # End of row.
	     puts " "
	end
	end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])



image.output_image
