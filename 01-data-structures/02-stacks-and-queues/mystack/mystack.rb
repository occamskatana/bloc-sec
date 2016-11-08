class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.insert(@stack.length, item)
    update_top
  end

  def pop
    temp = self.top
    @stack.delete(self.top)
    update_top
    return temp
  end

  def empty?
    if @stack.length == 0
      return true
    else
      return false
    end
  end

  protected
    def update_top
      if @stack.empty?
        self.top = nil 
      else
        self.top = @stack[@stack.length - 1]
      end
    end
end