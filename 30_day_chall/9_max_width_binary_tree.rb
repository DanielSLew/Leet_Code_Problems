# Maximum Width of Binary Tree

# Given binary tree, write a func to get max width of binary tree
# width is max width among all levels
# binary tree has same structure as full binary tree, but some nodes are null

# Width of one level is defined as length between end nodes
  # left and right most non null nodes in a level
  # null nodes between the two are counted into length calc

Input: 

           1
         /   \
        3     2
       / \     \  
      5   3     9 

Output: 4
Explanation: The maximum width existing in the third level with the length 4 (5,3,null,9).

Input: 

          1
         / \
        3   2
       /     \  
      5       9 
     /         \
    6           7
Output: 8
Explanation:The maximum width existing in the fourth level with the length 8 (6,null,null,null,null,null,null,7).

# Need to Record a left and right "idx" corresponding to the right and left nodes
# of a row

# { 0 => {left: 0, right: 0},    0 - 0 + 1 = 1 width
#   1 => {left: 0, right: 1},    (1 - 0) + 1 = 2 width
#   2 => {left: 0, right: 3},    (3 - 0) + 1 = 4 width
#   3 => {left: 0, right: 7...}  (7 - 0) + 1 = 8 width

# Keep track of the widest row in a variable
# When we reach a row that is longer, replace that number
# Find all left most values first
# Then find all rightmost values, when we find the rightmost value
  # check right - left + 1 against the current widest row

# to find leftmost value:
  # Keep track of current idx
  # Keep track of current level
  # Keep traversing down the left side
  # When we traverse down a level on the left side, don't change idx
    # Record the leftmost value for that level
  # If we traverse down on the right side increase idx by 1
    # Record the leftmost value for that level
    # Increase idx by 1
  # Repeat steps until we have all the leftmost indices that we can find

# If we don't have all the leftmost values, repeat process after traversing
  # on the right initially
  # skip the level if we already have the leftmost value for the level

# To find rightmost value:
  # keep track of current idx
  # When we move to the right
    # increase idx by 1
    # Record the idx as rightmost value for that level
  # if we move to the left
    # Record the idx as rightmost value
  # Increase idx by 1 again & Move to the next level
  # repeat steps

# we stop trying to traverse down rows, if we reach the bottom
  # ie both the left and right nodes are nil

# If we don't find both a right and leftmost node for a level
  # then the level only has one node and 1 width

def find_max_width(node, idx, level, info)
  if info[level]
    width = idx - info[level] + 1
    info[:max] = width if width > info[:max]
  else
    info[level] = idx
  end

  if node.left
    leftIdx = (idx + 1) * 2 - 2
    find_max_width(node.left, leftIdx, level+1, info)
  end

  if node.right
    rightIdx = (idx + 1) * 2 - 1
    find_max_width(node.right, rightIdx, level+1, info)
  end
end

def width_of_binary_tree(root)
  info = {max: 1}
  find_max_width(root, 0, 0, info)

  return info[:max]
end


