require 'csv'
def input_to_iterations(csv_path)
	csv_array = []
	ratio = 0
	CSV.foreach(csv_path) do |row|
		csv_array << row
	end
	i = 0

	output_file = CSV.open('./output.csv', 'w')
	csv_array.each do |array|
		i += 1
		next if array[0].to_i == 0
		ratio = array[1].to_f / array[0].to_i
		puts "Ratio for size #{i} is #{ratio} / 1"
		output_file << ["#{i}", "#{ratio}"]
	end
	
end

csv = File.expand_path("loglinear_intro.csv")

input_to_iterations(csv)