require "pry"

class Image 


	def initialize (image_data)
		
		@image_data = image_data

	end


	def output_image 

		# Loop over each row array.
		@image_data.each {|x| puts x.join }

		

		#puts @image_data.map{ |i| i.join }.join("\n") <-- Fancy

	end

	def blur

		blur_data = Marshal.load( Marshal.dump(@image_data) )
		

		blur_data.each_with_index do |row, y|

		    # Loop over each cell in the row
		    row.each_with_index do |pixel, x|
				# Are you next to a 1?
				if next_to_a_one?(x, y)
					blur_data[y][x] = 1
				end
			end




		end

		@image_data = blur_data


	end

	def blur_distance
		
	end

	def next_to_a_one? (x,y)

		return true if @image_data[y][x + 1] == 1  
		return true if @image_data[y][x - 1] == 1 && x-1 >= 0
		return true if !@image_data[y + 1].nil? && @image_data[y + 1][x] == 1
		return true if @image_data[y - 1][x] == 1 

		return false

	end



end

image = Image.new([
	[1, 0, 0, 1],
	[0, 0, 0, 0],
	[0, 0, 0, 0],
	[1, 0, 0, 1]
	])
image.output_image
puts " "
image.blur
image.output_image