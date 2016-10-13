require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
  end

  def []=(key, value)
    index = self.index(key, self.size)
    node = Node.new(key, value)

    if @items[index] == nil
      list = LinkedList.new()
      list.add_to_front(node)
      @items[index] = list
    else 
      @items[index].add_to_front(node) 
    end

    self.resize() if load_factor > self.max_load_factor
  end

  def [](key)
    index = self.index(key, self.size)
    if @items[index].head == nil 
      return nil 
    elsif @items[index].head.next != nil
      node = @items[index].head
      match = nil
      begin 
        if node.key == key
          match = node.value
        end
        node = node.next
      end until node.next == nil
      return match
    else
      return @items[index].head.value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    asc = 0
    key.each_byte do |c|
      asc += c 
    end
    return asc % size
  end

  # Calculate the current load factor
  def load_factor
    count = 0
    array_length = 0

    @items.each do |item|
      if item != nil 
        count += item.length
      end
    end
    load = count / @items.length.to_f
    return load
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    double = @items.length.to_i * 2
    old_array = @items 
    @items = Array.new(double)
    
    old_array.each do |item|

      if item != nil 
        index = self.index(item.head.key, double)
        @items[index] = item
      end
    end
  end
end
