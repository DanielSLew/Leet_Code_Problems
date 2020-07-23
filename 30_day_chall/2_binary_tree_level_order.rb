# Binary Tree Level Order

# Given a binary try return bottom-up level order traversal of its nodes' values
# Given
[3,9,20,null,null,15,7]

   3
   / \
  9  20
    /  \
   15   7

# return

[
  [15,7],
  [9,20],
  [3]
]

# We receive a TreeNode w/ properties :val, :left, :right
# left and right are either nil or a TreeNode

# Recursively walk through the tree and unshift the nodes onto it
# have a tree variable = []

# First we have 3
  # unshift value onto tree variable [3]
  # unshift the root nodes left.value and right.value if they are not nil [9, 20]
  # Check to see if left is nil, if it is then return, otherwise call itself passing left in
  # check to see if right is nil, if it then return, otherwise call itself passing right in

def walk_tree(n1, n2, result, depth)
  vals = []
  vals << n1.val if n1
  vals << n2.val if n2

  result[depth] ? result[-depth-1].concat(vals) : result.unshift(vals) unless vals.empty?

  walk_tree(n1.left, n1.right, result, depth+1) if n1
  walk_tree(n2.left, n2.right, result, depth+1) if n2
end

def level_order_bottom(root)
  return [] unless root  
  tree_node_array = []
  tree_node_array << [root.val]

  walk_tree(root.left, root.right, tree_node_array, 0)
  tree_node_array
end
