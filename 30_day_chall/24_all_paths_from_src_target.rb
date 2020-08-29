# Given a directed acyclic graph of N nodes
# Find all possible paths from node 0 to node N-1
# Return them in any order

# Graph is given as follows: nodes are 0, 1, ... graph.length - 1.
# graph[i] is a list of all nodes j  for which the edge (i, j) exists

# Example:
# Input: [[1,2],[3],[3],[]]
# Output: [[0,1,3],[0,2,3]]
# Explanation: The graph looks like this:
# 0--->1
# |    |
# v    v
# 2--->3
# There are two paths: 0 -> 1 -> 3 and 0 -> 2 -> 3.

# [[1,2],[2],[3],[4,5],[5],[]]


# Start from the first node, take each path that exists in that node

# Keep taking all available paths until they end
# They end when they reach a node that has no vertices, or when they reach
  # the final node (graph.length - 1)

# Use depth first search, take one path at a time and keep track of it
  # add each new node to the current path when we visit it using the path_idx pointer
  # Increase the path idx pointer
  # If the current_path ends in the final node, save that path to results arr
# If the path doesn't end in final node, or reaches a visited node
  # Walk the path backwards decrease the path_idx pointer so that we can continue
# Keep track of the previous_node so we can return to that node and decrease our pointer



def all_paths_source_target(graph)
  current_path = []
  results = []

  dfs(graph, results, 0, current_path)
  return results
end

def dfs(graph, results, current_node, current_path)
  if current_node == graph.length - 1
    return results << (current_path + [current_node])
  end

  graph[current_node].each do |node|
    dfs(graph, results, node, (current_path + [current_node]))
  end
end


# Refactored to one method

def all_paths_source_target(graph, results=[], current_node=0, current_path=[])
  if current_node == graph.length - 1
    return results << (current_path + [current_node])
  end

  graph[current_node].each do |node|
    all_paths_source_target(graph, results, node, (current_path + [current_node]))
  end

  return results
end


