class Node
	attr_accessor  :value , :left , :right

	def initialize(value) 
	  @value = value
	end

	def insert(value)
	  if @value > value
	  	self.right.nil? ? self.right = Node.new(value) : self.right.insert(value)
	  else
	  	self.left.nil? ? self.left = Node.new(value) : self.left.insert(value)
	  end
	end

	def leaf?
		self.left.nil? && self.right.nil?
	end

	def children
		[self.left, self.right]
	end

end


class BinarySearchTree
  attr_accessor :root

	def initialize
		@root = nil
	end

	def insert(value)
	 if @root.nil?
	 	return @root = Node.new(value)
	 else
	 	@root.insert(value)
	 end
	end
end


#Binary search tree
@newbst = BinarySearchTree.new
@newbst.insert(10)
@newbst.insert(9)
@newbst.insert(11)
puts "Binary Search Tree"
puts @newbst.inspect