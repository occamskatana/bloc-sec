def improved_ruby_one(*arrays)
  combined_array = arrays.flatten

  sorted_array = [combined_array.pop]

  for val in combined_array
    i = 0
    len = sorted_array.length
    while i < len
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_array.last
        sorted_array.insert(i + 1, val)
        break
      end
      i+=1
    end
  end
  # Return the sorted array
  return sorted_array
end

