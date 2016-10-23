require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    last = nil
    current = root

    loop do 

      if current.left != nil && current.rating >= node.rating 
        current = current.left 
      end

      if current.right != nil && current.rating <= node.rating  
        current = current.right
      end

      if current.left == nil 
        if current.rating > node.rating 
          current.left = node
          node.parent = current  
          break
        end
      end

      if current.right == nil 
        if current.rating < node.rating 
          current.right = node 
          node.parent = current
          break 
        end
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    current = root
    stack = [root]
    
    return nil if data == nil

    while !stack.empty?
      current = stack.pop
      return current if current.title == data 
      stack << current.left if current.left != nil 
      stack << current.right if current.right != nil 
    end
    return nil 
  end

  def delete(root, data)
    return nil if data == nil 
    children = []
    current = self.find(root, data)
    parent = current.parent

    children << current.left if current.left != nil  
    children << current.right if current.right != nil 

    parent.left = nil if parent.left != nil && parent.left.title == data
    parent.right = nil if parent.right != nil && parent.right.title == data

    if children.length != 0
      children.each do |child|
        self.insert(root, child)
      end
    end

    return true
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]
    while !queue.empty?
      current = queue.shift()
      print "#{current.title}: #{current.rating}\n"
      queue.push(current.left) if current.left != nil 
      queue.push(current.right) if current.right != nil 
    end
    return true
  end
end

#lines here used for print fu nction testing, may or may not be used in the future
# root = Node.new("The Matrix", 87)
# pr = Node.new("Pacific Rim", 72)
# tree = BinarySearchTree.new(root)

# tree.insert(root, pr)

# puts tree.find(root, pr.title)
# puts tree.delete(root, pr.title)

# puts tree.find(root, pr.title)