require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)

  end

  def []=(key, value)
    index = self.index(key, @items.length)
    if @items[index] == nil 
      @items[index] = Node.new(key, value)
    else 
      new_index = nil
      if self.next_open_index(index) != -1
        @items[self.next_open_index(index)] = Node.new(key, value)
      else
        self.resize
        @items[self.next_open_index(index)] = Node.new(key, value)
      end
    end
  end

  def [](key)
    hashed_index = self.index(key, @items.length)
    answer = nil
    for i in hashed_index..@items.length - 1 
      if @items[i] == nil || @items[i].key != key
        next
      else 
        answer = @items[i].value
      end
    end
    return answer
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    asc  = 0
    key.each_byte do |c|
      asc += c
    end
    return asc % size
  end

  def print
    @items.each do |item|
      if item != nil
        puts("{#{item.key}: #{item.value}}") 
      end
    end
    puts "Load Factor is: #{self.load_factor()}"
  end

  def load_factor
    count = 0
    for i in 0..@items.length - 1 do 
      count += 1 if @items[i] != nil
    end
    return count.to_f / @items.length.to_f
  end



  # Given an index, find the next open index in @items
  def next_open_index(index)
    temp = index
    while @items[temp] != nil 
      temp += 1
    end
    
    if temp < @items.length 
      return temp 
    else
      return -1
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    new_length = @items.length * 2
    old_array = @items 
    @items = Array.new(new_length)
    old_array.each do |item|
      if item != nil 
        new_index = self.index(item.key, @items.length)
        while @items[new_index] != nil 
          self.resize
        end
        @items[new_index] = item
      end
    end
  end
end

star_wars_movies = OpenAddressing.new(6)
star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"
star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"
star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"
star_wars_movies["Star Wars: A New Hope"] = "Number Four"
star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"
star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"

star_wars_movies.print