class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = nil
  end

  def enqueue(element)
    if @queue.empty?
      @queue << element 
    else
      @queue.insert(0, element)
    end
    update_ends
  end

  def dequeue
    temp = @head 
    @queue.delete(@head)
    update_ends
    return temp
  end

  def empty?
    if @queue.length == 0
      return true
    else
      return false
    end
  end

  protected 
    def update_ends
      @head = @queue[0]
      @tail = @queue[@queue.length - 1]
    end
end