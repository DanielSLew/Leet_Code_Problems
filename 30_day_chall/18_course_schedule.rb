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

# iterate through subarrays, keep track of courses in array
# create a hash table for prereqs where the values are array of courses
# num of courses is given, so just grab the first num that isn't listed to get starting point

# if size of courses arr == num of courses, then return []

courses
[1, 2, 3] => 0 is missing, so 0 is starting point
{ 1: [0], 2: [0], 3: [3, 2] }

prereqs
{ 0: [1, 2], 1: [3], 2: [3] }

visited
{ }

# Create a class order array
# Push starting num onto array, add 0: true to visited hash
# Add all values in starting point array to order and queue
# Pop queue, if we have not visited the num then add that num to order array
# add that num is visited hash, and add the values of the array to the queue
# repeat until queue is empty

# return class order array

def find_order(num_courses, prereqs)
  prereqs_hash = {}
  indegree = Array.new(num_courses, 0)

  prereqs.each do |(course, prereq)|
    indegree[course] += 1

    if prereqs_hash[prereq]
      prereqs_hash[prereq] << course
    else
      prereqs_hash[prereq] = [course]
    end
  end

  class_order = []
  queue = []

  indegree.each_with_index do |degree, course|
    queue << course if degree == 0
  end

  until queue.empty?
    current_course = queue.shift

    class_order << current_course

    if prereqs_hash[current_course]
      prereqs_hash[current_course].each do |course| 
        indegree[course] -= 1
        queue << course if indegree[course] == 0
      end
    end
  end

  indegree.select {|degree| degree > 0}.any? ? [] : class_order
end


