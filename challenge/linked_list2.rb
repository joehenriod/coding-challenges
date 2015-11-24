
class Stack
    attr_reader :data
    
    # Push a value onto the stack
    def push(value)
        # IMPLEMENT ME!
        if @data == nil
          @data = LinkedListNode.new(value)
        else
          @data = LinkedListNode.new(value, @data)
        end
    end

    # Pop an item off the stack.  
    # Remove the last item that was pushed onto the
    # stack and return the value to the user
    def pop
        # I RETURN A VALUE
        if @data != nil
          value = @data.value
          @data = @data.next_node
          return value
        end
    end
end

class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

 end

def print_values(list_node)
  if list_node.nil?
    print "nil\n"
    return
  end

  print "#{list_node.value} --> "
  if list_node.next_node.nil?
    print "nil\n"
    return
  else
    print_values(list_node.next_node)
  end
end
 


node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

 
def reverse_list(list)
    # ADD CODE HERE
   

    #LinkedListNode.new(stack.pop, LinkedListNode.new(stack.pop, LinkedListNode.new(stack.pop)))


     #puts stack.data
    # ADD CODE HERE
end

stack = Stack.new
stack.push(10)
stack.push(11)
stack.push(13)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)

print_values(revlist)

