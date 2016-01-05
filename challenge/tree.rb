class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

  # dfs_11 return nil if 11 isn't in the tree

  # if 11 is included return node containing 11 

  def dfs_11
    puts @payload
    return self if @payload == 11
    @children.each do |child|
        var1 = child.dfs_11_2
        if var1 == nil 
        else
          return var1
        end
      
    end

    return nil

  end


    def dfs_11_2
    puts @payload
    return self if @payload == 11
    @children.each do |child|
        var1 = child.dfs_11
        if var1 == nil 
        else
          return var1
        end
      
    end

    return nil

  end


end



# The "Leafs" of a tree, elements that have no children
fifth_node    = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])


# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, fifth_node])

puts "PAYLOAD: #{trunk.dfs_11}"

class Queue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end


queue = Queue.new

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue
# queue.enqueue(3)
# queue.enqueue(4)
# queue.enqueue(5)
# puts queue.dequeue
# queue.enqueue(6)
# puts queue.dequeue
# puts queue.dequeue
# puts queue.dequeue
# puts queue.dequeue

# Outputs: 1, 2, 3, 4, 5, 6