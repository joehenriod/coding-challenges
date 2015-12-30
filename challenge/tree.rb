class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
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

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue
queue.enqueue(3)
queue.enqueue(4)
queue.enqueue(5)
puts queue.dequeue
queue.enqueue(6)
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue
puts queue.dequeue

# Outputs: 1, 2, 3, 4, 5, 6