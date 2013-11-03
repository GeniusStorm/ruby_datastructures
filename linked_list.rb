class Node

attr_accessor :data, :next

	def initialize(data)
		@data = data
		@next = nil
	end
end

class LinkedList

	def initialize
		@head = nil
		@tail = nil		
	end

	def add_to_head(entry) #adding to the head of the list
		if @head.nil?
			@head = entry
			@tail= entry
		else
			entry.next = @head
			@head = entry
		end
	end

	def add_to_tail(entry) #adding to the tail of the list
		if @head.nil?
			@head = entry
			@tail = entry
		else
			@tail.next = entry
			@tail = entry
		end
	end

	def remove_from_top #removing the toppest node from the list
		return nil if @head.nil?
		entry = @head
		@head= @head.next
		return entry
	end

	def each #custom iterator to loop in through each of the nodes
	  return nil if @head.nil?
	  entry = @head
	  idx = 0
	  until entry.nil?
	  	yield entry,idx
	  	entry = entry.next
	  	idx = idx + 1
	  end
	end

	def remove_from_bottom #removing the node at the tail of the list
	  self.each do |node|
	  	unless node.next.next.nil?
	  	 @tail = node.next
	  	 node.next.next = nil
	  	 return
	    end   
	  end
    end

    def traverse(position) #traverse and returns the node data given a position/index
    	self.each do |node,index|
    	   return node.data if index == position
    	end
    end

    def mth_to_last(position)

    	return nil if @head.nil?
    	current_idx = @head
    	self.each do |node, index|  #traverse through the last node to get the total number of elements
	    	if index < position && current_idx.next
	    		current_idx = current_idx.next
	    	end
    	end
    	    	    	 
    	behind_idx = @head
    	while current_idx.next
    		current_idx = current_idx.next
    		behind_idx = behind_idx.next
    	end

    	return behind_idx;

    end

end



#Adding to the top of the linked list
# @newlist = LinkedList.new
# node1 = Node.new("First Node")
# @newlist.add_to_head(node1);
# node2 = Node.new("Second Node")
# @newlist.add_to_head(node2);



#Adding to the bottom of the list
# @newlist2 = LinkedList.new
# node1 = Node.new("First Node")
# @newlist2.add_to_tail(node1);
# node2 = Node.new("Second Node")
# @newlist2.add_to_tail(node2);
# node3 = Node.new("Third Node")
# @newlist2.add_to_tail(node3);
# node4 = Node.new("fourth Node")
# @newlist2.add_to_tail(node4);
# node5 = Node.new("Fifth Node")
# @newlist2.add_to_tail(node5);
# puts "Our new linked list looks like"
# puts @newlist2.inspect
# puts "mth to the last element"
# puts @newlist2.mth_to_last(9).inspect

# @newlist2.remove_from_top
# puts "After removing from bottom,Our new linked list looks like"
# puts @newlist2.remove_from_bottom
# puts @newlist2.inspect

# puts "traversing through the linked list"
# puts @newlist2.traverse(2)





