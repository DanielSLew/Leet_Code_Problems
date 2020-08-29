# Given inorder and postorder traversal of a tree
# construct the binary tree

# assume there are no duplicates

inorder = [9,3,15,20,7]
postorder = [9,15,7,20,3]

Return the following binary tree:

    3
   / \
  9  20
    /  \
   15   7

inorder = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
postorder = [3, 4, 5, 6, 8, 9, 10, 11, 12, 7]

        7
     /     \
    5       11
   /  \    /  \
  4    6  9    12
 /       /  \ 
3       8   10
# Inorder traverses the right subtree and then the root, then the right
# postorder traverses the left subtree, then the right, then the root

# The last elem in postorder will be the root
# The left subtree is inorder until we reach the root
# then the right subtree is inorder after we reach the root

# Create a root tree node using the last elem in postorder
# Find the left_subtree and right_subtree for postorder
  # Slice the length of the left and right subtrees for inorder in postorder

# set root.left to recursive call to build_tree passing in left inorder & postorder
# do the same for root.right

# Return the root node at the end
# Set guard clause to return nil unless inorder is not empty


def build_tree(inorder, postorder)
  return nil if inorder.empty?

  root = TreeNode.new(postorder.pop)
  root_idx = inorder.index(root.val)

  root.left = build_tree(inorder[0...root_idx], postorder[0...root_idx])
  root.right = build_tree(inorder[root_idx+1..-1], postorder[root_idx..-1])

  root
end

