# Given two binary trees
# Write a func to check if they are the same or not
# They are the same if they are structurally identical w/ the same node values

Input:     1         1
          / \       / \
         2   1     1   2

        [1,2,1],   [1,1,2]

Output: false

Input:     1         1
          / \       / \
         2   3     2   3

        [1,2,3],   [1,2,3]

Output: true

    2        2
     \     /   \
      4   3     4
# Use a separate stack for each tree containing each root node
# pop both current nodes, if they are equal values then keep going
# push the left node of both, and right node of both if they have them
  # If one has and other does not, return false
# keep repeating while the stack is not empty

# If the stack is empty and we get to the end that means they are identical
# return true

def is_same_tree(p, q)
  return true if !p && !q
  return false unless p && q

  stackp = [p]
  stackq = [q]

  while stackp.any?
    nextp = stackp.pop
    nextq = stackq.pop

    return false if nextp.val != nextq.val

    if (nextp.left && !nextq.left) || (!nextp.left && nextq.left) ||
       (nextp.right && !nextq.right) || (!nextp.right && nextq.right)
      return false
    end

    if nextp.left && nextq.left
      stackp << nextp.left
      stackq << nextq.left
    end

    if nextp.right && nextq.right
      stackp << nextp.right
      stackq << nextq.right
    end
  end
  true
end

# With recursion

def is_same_tree(p, q)
  return true if !p && !q
  return false unless p && q

  return false if p.val != q.val

  is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end
