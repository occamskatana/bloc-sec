include Enumerable
def insertion_sort(collection)
  # #1
  sorted_collection = [collection.delete_at(0)]

  for val in collection
    sorted_collection_index = 0
    # #2
    while sorted_collection_index < sorted_collection.length
      if val <= sorted_collection[sorted_collection_index]
        # #3
        sorted_collection.insert(sorted_collection_index, val)
        break
      elsif sorted_collection_index == sorted_collection.length - 1
        # #4
        sorted_collection.insert(sorted_collection_index + 1, val)
        break
      end

      sorted_collection_index += 1
    end
  end

  sorted_collection
end

def selection_sort(collection)
  length = collection.length
  # #1
  for i in 0..length - 2
    # #2
    min_index = i
    # #3
    for j in (i + 1)...length
      if collection[j] < collection[min_index]
        # #4
        min_index = j
      end
    end

    # #5
    tmp = collection[i]
    collection[i] = collection[min_index]
    collection[min_index] = tmp
  end
  collection
end

def bubble_sort(collection)
  n = collection.length
  # #1
  begin
    swapped = false

    # #2
    (n - 1).times do |i|
      # #3
      if collection[i] > collection[i + 1]
        tmp = collection[i]
        collection[i] = collection[i + 1]
        collection[i + 1] = tmp
        swapped = true
      end
    end
  end until not swapped

  collection
end

def merge_sort(collection)
  # #1
  if collection.length <= 1
    collection
  else
    # #2
    mid = (collection.length / 2).floor
    left = merge_sort(collection[0..mid - 1])
    right = merge_sort(collection[mid..collection.length])
    # #3
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    # #4
    right
  elsif right.empty?
    # #5
    left
  elsif left.first < right.first
    # #6
    [left.first] + merge(left[1..left.length], right)
  else
    # #7
    [right.first] + merge(left, right[1..right.length])
  end
end

def swap(array, index1, index2)
  array[index1], array[index2] = array[index2], array[index1]
  return array
end

def partition(array, low, high)
  pivot = array[high]
  i = low

  for j in low..high - 1 do
      if array[j] <= pivot
        array = swap(array, j, i)
        i += 1
      end
    end
    array = swap(array, i, high)
    return i
  end

class Array
  def quick_sort
    return self if self.length <= 1
    pivot_index = self.length / 2
    pivot_item = self[pivot_index]
    self.delete_at(pivot_index)
    lesser = []
    greater = []
    self.each do |item|
      if item <= pivot_item
        lesser << item
      else
        greater << item
      end
    end
    return lesser.quick_sort + [pivot_item] + greater.quick_sort
  end

  def heapsort!
    1.upto(self.length - 1) do |i|
      child = i
      while child > 0
        parent = (child - 1) / 2
        if self[parent] < self[child]
          self[parent], self[child] = self[child], self[parent]
          child = parent
        else
          break
        end
      end
    end
    i = self.length - 1
    while i > 0
      self[0], self[i] = self[i], self[0]
      i -= 1
      parent = 0
      while parent * 2 + 1 <= i
        child = parent * 2 + 1
        if child < i && self[child] < self[child + 1]
          child += 1
        end
        if self[parent] < self[child]
          self[parent], self[child] = self[child], self[parent]
          parent = child
        else
          break
        end
      end
    end
    return self
  end

  def bucket_sort(bucket_size=5)
  	sorted_array = []
  	max = self.max
  	min = self.min
  	bucket_count = ((max - min) / bucket_size) + 1
  	buckets = Array.new(bucket_count){Array.new}
  	for i in 0..self.length - 1 do 
  		indx = ((self[i] - min) / bucket_size).floor
  		buckets[indx] << self[i] unless self[i] == nil
  	end
  	buckets.each do |bucket|
  		sorted = insertion_sort(bucket)
  		sorted.each do |item|
  			sorted_array << item
  		end
  	end
  	return sorted_array
  end
end


