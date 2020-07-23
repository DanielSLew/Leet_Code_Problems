# Given a doubly linked list in addition to the next and previous pointers
# It could have a child pointer which may or may not point to a separate
  # doubly linked list
# child lists may have one or more children of their own, etc

# keep track of results in an array
# When we visit a node, push node.val onto the array
# need to visit each node, when we get to a node that has no next node
  # ie next == nil
  # then we return
# before we make node.next the current node
  # if node.child
  # make node.child the current node
    # push node.val onto results
    # continue traversing

def flatten(root)
  stack = [root]

  while stack.any?
    current_node = stack.pop

    if current_node.child
      stack << current_node.next if current_node.next

      current_node.next = current_node.child
      current_node.child.prev = current_node
      stack << current_node.child
      current_node.child = nil
    elsif current_node.next
      stack << current_node.next
    elsif stack.any?
      next_link = stack.last
      current_node.next = next_link
      next_link.prev = current_node
    end
  end

  root
end
