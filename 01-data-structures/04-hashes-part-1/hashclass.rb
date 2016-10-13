require_relative 'hash_item.rb'
class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    new_item = HashItem.new(key, value)
    hashed_index = index(new_item.key, self.size)

    if @items[hashed_index] != nil && self[key] != value
      begin
        resize()
      end until @items[hashed_index] == nil

      @items[hashed_index] = new_item
    else
      @items[hashed_index] = new_item
    end

  end


  def [](key)
    if @items[index(key, self.size)] == nil 
      return nil 
    else
      return @items[index(key, self.size)].value 
    end
  end

  def resize
    double = self.size * 2
    old_array = @items
    new_array = Array.new(double)

    @items = new_array

    old_array.each do |item|
      if item != nil 
        self[item.key] = item.value
      end
    end

  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    asc = 0
    key.to_s.each_byte do |c|
      asc += c 
    end
    return asc % self.size
  end

  # Simple method to return the number of items in the hash
  def size
    return @items.length
  end

end