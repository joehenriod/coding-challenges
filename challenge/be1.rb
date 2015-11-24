require "pry"

class Image 


	def initialize (image_data)
		
		@image_data = image_data

	end


	def output_image 

		# Loop over each row array.
		@image_data.each {|x| puts x.join }

	end

	def blur(n = 2)

		blur_data = Marshal.load( Marshal.dump(@image_data) )
		

		blur_data.each_with_index do |row, y|

		    # Loop over each cell in the row
		    row.each_with_index do |pixel, x|
				# Are you next to a 1?
				blur_pixel(x, y, blur_data, n) if is_a_one?(x, y)
			end

		end

		@image_data = blur_data
	end

	private 

		def blur_pixel x, y, blur_data, n
			blur_data.each_with_index do |compare_row, compare_y|
				compare_row.each_with_index do |compare_pixel, compare_x|
					if(manhattan_distance(x, y, compare_x, compare_y) <= n)
						blur_data[compare_y][compare_x] = 1
					end
				end
			end
		end

		def is_a_one? (x,y)
			@image_data[y][x] == 1  
		end

		def manhattan_distance (x, y, compare_x, compare_y)
			(x - compare_x).abs + (y - compare_y).abs
		end


end

image = Image.new([
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0],
	[0, 0, 1, 0, 0],
	[0, 0, 0, 0, 0],
	[0, 0, 0, 0, 0],
	])
image.output_image
puts " "
image.blur(3)
image.output_image