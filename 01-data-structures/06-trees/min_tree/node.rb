class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right
  attr_accessor :parent
  attr_accessor :position
  
  def initialize(title, rating)
  	@title = title
  	@rating = rating 
  end

  def <= (other_node)
  	self.rating <= other_node.rating if self.rating != nil  && other_node.rating != nil 
  end
  
end