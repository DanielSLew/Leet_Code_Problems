# Given a binary tree, return the zigzag level order traversal of its nodes' vals
# from left to right, then right to left for the next level
# etc.

For example:
Given binary tree [3,9,20,null,null,15,7],
    3
   / \
  9  20
    /  \
   15   7

return its zigzag level order traversal as:
[
  [3],
  [20,9],
  [15,7]
]

# return a subarray for each level of the tree
# traverse through the tree, adding values to the appropriate
# "level" as we reach them, for odd levels, unshift the values onto array
# for even levels, push values onto array
  # Each other subarray needs to have its values reversed

# Use recursion to move through the tree, passing the reuslts array and the level
# for each node, call the function on the left node if it exists and same for the right

# Return the results array int he end

def zigzag_level_order(root)
  return [] unless root

  zigzag_array = [[root.val]]

  traverse(root.left, zigzag_array, 1) && traverse(root.right, zigzag_array, 1)
end

def traverse(node, zigzag_array, level)
  return zigzag_array if node.nil?

  if zigzag_array[level]
    level % 2 == 0 ? zigzag_array[level].push(node.val) : 
                     zigzag_array[level].unshift(node.val)
  else
    zigzag_array[level] = [node.val]
  end

  traverse(node.left, zigzag_array, level+1) && traverse(node.right, zigzag_array, level+1) 
end


# Refactored to one method

def zigzag_level_order(node, zigzag_array=[], level=0)
  return zigzag_array if node.nil?

  if zigzag_array[level]
    level.even? ? zigzag_array[level].push(node.val) : 
                  zigzag_array[level].unshift(node.val)
  else
    zigzag_array[level] = [node.val]
  end

  zigzag_level_order(node.left, zigzag_array, level+1) && 
  zigzag_level_order(node.right, zigzag_array, level+1)
end

