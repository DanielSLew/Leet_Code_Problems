# Total of n courses
  # labeled from 0 to n-1

# courses may have prereqs
  # [0, 1]
  # have to take course 1 first, to take course 0

# Given total num of courses and prereq pairs
# Return the ordering of courses you should take to finish all courses

# Return an empty array if it is impossible to finish all courses

Input: 2, [[1,0]] 
Output: [0,1]
Explanation: There are a total of 2 courses to take. To take course 1 you should have finished   
             course 0. So the correct course order is [0,1] .

Input: 4, [[1,0],[2,0],[3,1],[3,2]]
Output: [0,1,2,3] or [0,2,1,3]
Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both     
             courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0. 
             So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3] .


# Find all the starting vertices
# ie vertices that have no prereqs
  # iterate through check each subarray[1] keep a list of prereqs 