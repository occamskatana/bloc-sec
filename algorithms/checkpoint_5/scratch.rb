require 'benchmark'

def goodbye_world(n)
  puts "Goodbye World! #{n}"
end

goodbye_world("John Carter")

arr = (1..4000000).to_a

def find_largest(array)
  largest = array[0]

  array.length.times do |i|
    if array[i] >= largest
      largest = array[i]
    end
  end

  return largest
end

def build_2d(n)
  return Array.new(n){
    indicator = 0
    Array.new(n){|i|
      indicator += i
      indicator
    }
  }
end



def find_largest_array(array)
  largest = [0][0]
  iterations = 0
  array.length.times do |i|
    subarr = array[i]
    subarr.length.times do |i|
      if subarr[i] >= largest
        largest = subarr[i]
      end
      iterations += 1
    end
  end
  puts iterations
  return largest
end

# Benchmark.bmbm do |x|
# 	100.times do |i|
# 		tmp = build_2d(i)
# 		x.report("#{i} times"){
# 			find_largest_array(tmp)
# 		}
# 	end
# end
##Carpet Bomb Commented to reduce output noise

def numbers_recursive(n)
  if n == 0
    return 0
  elsif n ==1
    return 1
  else
    return numbers_recursive(n - 1) + numbers_recursive(n - 2)
  end
end

# Carpet bombed to reduce console output noise
# Benchmark.bmbm do |x|
# 	40.times do |i|
# 		x.report("Numbers recursive #{i}") {
# 			numbers_recursive(i)
# 		}
# 	end
# end

def iterative(n)
  num1 = 0
  num2 = 1

  i = 0

  while i < n - 1
    tmp = num1 + num2

    num1 = num2

    num2 = tmp

    i += 1
  end

  return num2
end

def sort(array, from=0, to=nil)
  if to == nil
    to = array.count - 1
  end
  if from >= to
    return
  end
  pivot = array[from]
  min = from
  max = to
  free = min

  while min < max
    if free == min
      if array[max] <= pivot
        array[free] = array[max]
        min += 1
        free = max
      else
        max -= 1
      end
    elsif free == max
      if array[min] >= pivot
        array[free] = array[min]
        max -= 1
        free = min
      else
        min += 1
      end
    else
      raise "Inconsistent State"
    end
  end
  array[free] = pivot
  sort(array, from, free - 1)
  sort(array, free + 1, to)
  return array
end


a = Array.new(5000000){arr.sample}
print sort(a)