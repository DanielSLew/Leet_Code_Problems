Remove all elements from a linked list of ints that have value val

Input:  1->2->6->3->4->5->6, val = 6
Output: 1->2->3->4->5

# two args, listnode head & val to be removed
# Return the listnode head

# iterate through the entire linked list
# Keep track of current_node and next_node
# Current node starts as the head node

# find the first node that doesn't equal val and set head to that

# set next_node = current_node.next
# If next_node equals val then set current_node.next = next_node.next

# and set current_node = current_node.next

# Keep doing this while current_node.next is not nil

def remove_elements(head, val)
  loop do
    return unless head
    break if head.val != val
    head = head.next
  end

  current_node = head
  next_node = head.next

  while next_node
    if next_node.val == val
      next_node = next_node.next
      current_node.next = next_node
    else
      current_node = next_node
      next_node = next_node.next
    end
  end

  head
end