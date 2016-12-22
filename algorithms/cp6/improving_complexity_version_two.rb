class Array
  def counting_sort
    min = self.min
    max = self.max
    counts = Array.new(max-min+1, 0);
    self.each { |n| counts[n-min] += 1 }
    (0...counts.size).map { |i| [i + min] * counts[i] }.flatten
  end
end




def improved_ruby_two(*arrays)
  combined_array = arrays.flatten
  sorted = combined_array.counting_sort
  return sorted
end

