class Image 
	 attr_accessor :image1 
	 
	def initialize (image_data)
		
		@image_data = image_data

	end

	def initialize (blur_data)
		@blur_data = blur_data
	end


	def output_image 

		# Loop over each row array.
		@blur_data.each do |x|

		    # Loop over each cell in the row.
		    x.each do |cell|
			print cell
		    end

		    # End of row.
		     puts " "
		end

	end

	def blur

		blur_data = Marshal.load( Marshal.dump(@image_data) )
		
		@blur_data.each_with_index do |row, y|

		    # Loop over each cell in the row.
		    row.each_with_index do |pixel, x|
				# Are you next to a 1?
				dif next_to_a_one?(x, y)
					@blur_data[y][x] = 1
			    end
		    end

		    # End of row.
		     puts " "

		end
	end

	def next_to_a_one? (x,y)
		if x >= 0
			@blur_data[y][x.next] == 1
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
puts " "
image.blur
blur_data.output_image