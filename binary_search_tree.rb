class BinaryTree
 
 attr_accessor :root 

 def initialize
     @root = nil
 end

 def insert(value)
     if @root.nil?
       @root = Node.new(value)
     else
       @root.insert(value)
      end
 end

  def findNode(value)
    return "No root Found" if @root.nil?
    find_node_by_value(@root, value) 
  end


  def find_node_by_value(node,value)
    unless node.nil?
      if value ==  node.value
        return node
      elsif value > node.value
        find_node_by_value(node.right, value)
      else
        find_node_by_value(node.left, value)
      end
   else
     return "Node Not Found"
   end
  end

  def getTreeheight
    return 0 if @root.nil?
    calculateTreeHeight(@root)
  end

  def calculateTreeHeight(node)
   return 0 if node.nil?
   return 1 + [calculateTreeHeight(node.left), calculateTreeHeight(node.right)].max
  end

  def preorder_traversal
  	return "Root not defined" if @root.nil?
    preorder([],@root)
  end

  def preorder(arry=[], node)
  	arry << node.value
  	preorder(arry,node.left) unless node.left.nil?
  	preorder(arry,node.right) unless node.right.nil?
  	return arry
  end

  def preorder_traversal_without_recursion
  	stack =[]
  	arry =[]
  	return "Root not defined" if @root.nil?
  	stack.push(root)
  	while(stack.size > 0)
  	   node = stack.pop
  	   arry << node.value
  	   stack.push(node.right) unless node.right.nil?
  	   stack.push(node.left) unless node.left.nil?
  	end
  	return arry
  end

  def postorder_traversal
 	return "Root not defined" if @root.nil?
 	postorder([],@root)
  end

  def postorder(arry=[],node)
  	preorder(arry,node.left) unless node.left.nil?
  	preorder(arry,node.right) unless node.right.nil?
  	arry << node.value
  	return arry
  end

  def inorder_traversal
 	return "Root not defined" if @root.nil?
 	inorder([],@root)
  end

  def inorder(arry=[],node)
  	inorder(arry,node.left) unless node.left.nil?
  	arry << node.value
  	inorder(arry,node.right) unless node.right.nil?	
  	return arry
  end
end


class Node
  attr_accessor :value , :left , :right

  def initialize(value)
      @value = value
  end

  def insert(value)
   if self.value < value
     self.right.nil? ? self.right = Node.new(value) : self.right.insert(value)
   else
        self.left.nil? ? self.left = Node.new(value) : self.left.insert(value)
   end
  end

end

# tests
require 'rspec'

describe "Binary Tree Implementation" do

  before(:each) do 
    @binary_tree = BinaryTree.new
  end

   it "should insert children for a particular node" do
     @binary_tree.insert(10)
     @binary_tree.insert(9)
     @binary_tree.insert(11)
     @binary_tree.root.value.should be_equal(10)
     @binary_tree.root.left.value.should be_equal(9)
     @binary_tree.root.right.value.should be_equal(11)
   end

   it "should search a for a node in the binary tree" do
     @binary_tree.insert(10)
     @binary_tree.insert(9)
     @binary_tree.insert(11)
     @binary_tree.findNode(11).should be_kind_of(Node)
     @binary_tree.findNode(11).value.should == 11
     @binary_tree.findNode(1999).should == "Node Not Found"
   end

   it "should return the height of the tree" do
     @binary_tree.insert(8)
     @binary_tree.insert(3)
     @binary_tree.insert(10)
     @binary_tree.insert(1)
     @binary_tree.insert(6)
     @binary_tree.insert(14)
     @binary_tree.insert(4)
     @binary_tree.insert(7)
     @binary_tree.insert(13)
     @binary_tree.getTreeheight.should == 4
   end
 

   it "should do traverse the binary search tree in a preorder using recursion" do
   	 @binary_tree.insert(8)
     @binary_tree.insert(3)
     @binary_tree.insert(10)
     @binary_tree.insert(1)
     @binary_tree.insert(6)
     @binary_tree.insert(14)
     @binary_tree.insert(4)
     @binary_tree.insert(7)
     @binary_tree.insert(13) 
     @binary_tree.preorder_traversal.should == [8,3,1,6,4,7,10,14,13]
   end

    it "should do traverse the binary search tree in a preorder without using recursion" do
   	 @binary_tree.insert(8)
     @binary_tree.insert(3)
     @binary_tree.insert(10)
     @binary_tree.insert(1)
     @binary_tree.insert(6)
     @binary_tree.insert(14)
     @binary_tree.insert(4)
     @binary_tree.insert(7)
     @binary_tree.insert(13) 
     @binary_tree.preorder_traversal_without_recursion.should == [8,3,1,6,4,7,10,14,13]
   end

    it "should do traverse the binary search tree in a postorder using recursion" do
   	 @binary_tree.insert(8)
     @binary_tree.insert(3)
     @binary_tree.insert(10)
     @binary_tree.insert(1)
     @binary_tree.insert(6)
     @binary_tree.insert(14)
     @binary_tree.insert(4)
     @binary_tree.insert(7)
     @binary_tree.insert(13) 
     @binary_tree.postorder_traversal.should == [3,1,6,4,7,10,14,13,8]
   end


   it "should do traverse the binary search tree in a postorder using recursion" do
   	 @binary_tree.insert(8)
     @binary_tree.insert(3)
     @binary_tree.insert(10)
     @binary_tree.insert(1)
     @binary_tree.insert(6)
     @binary_tree.insert(14)
     @binary_tree.insert(4)
     @binary_tree.insert(7)
     @binary_tree.insert(13) 
     @binary_tree.inorder_traversal.should == [1, 3, 4, 6, 7, 8, 10, 13, 14]
   end


end