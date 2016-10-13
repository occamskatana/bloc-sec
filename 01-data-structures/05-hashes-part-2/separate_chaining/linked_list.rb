require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail



  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if tail != nil 
      self.tail.next = node 
      self.tail = node
    else 
      self.tail = node 
      self.head = node 
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current_node = self.head 
    previous_node = nil  
    if self.head.next != nil 
      begin
        previous_node = current_node 
        current_node = current_node.next 
      end until current_node.next ==  nil

      self.tail = previous_node
      self.tail.next = nil
    else 
      self.tail = nil
      self.head = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    current_node = self.head  
    begin 
      puts current_node.data 
      current_node = current_node.next 
    end until current_node.next == nil 
    puts current_node.data
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current_node = self.head  
    previous_node = nil 
    next_node = current_node.next

    begin 
      previous_node = current_node
      current_node = next_node 
    end until current_node = node 

    if current_node == self.head 
      self.remove_front
    elsif current_node == self.tail
      self.remove_tail
    else
      previous_node.next = current_node.next 
    end
  end

  def access_element(node_index)
    current_node = self.head
    count = 0

    while count <= 5000 
      current_node = current_node.next 
      count += 1 
    end

    return current_node
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    temp = self.head  
    self.head = node 
    self.head.next = temp
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    if self.head.next != nil 
      self.head = self.head.next 
    else 
      self.head = nil 
    end
  end

  #added this method because it is a pain in the ass to iterate through the list within an each block in the hash

  def length
    count = 1
    node = self.head

    while node.next != nil 
      node = node.next 
      count += 1
    end 
    return count
  end

end
