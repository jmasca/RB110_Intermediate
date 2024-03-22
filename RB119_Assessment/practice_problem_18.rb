system 'clear'
# rb119 interview assessment - practice problem 18

=begin
Create a method that takes an array of integers as an argument. Determine and return the index N for which all numbers with an index less than N sum to the same value as the numbers with an index greater than N. If there is no index that would make this happen, return -1.

If you are given an array with multiple answers, return the index with the smallest value.

The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the numbers to the right of the last element is 0.

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0

The above tests should each print true.
=end

# PROBLEM #

#   input: Array (of Integers)
#   output: Integer

#   rules:
#     explicit:
#       - method accepts and Array of Integers
#       - return Integer index N
#         - the sum of all elements before index N should be the same
#           as the sum of all elements after index N
#         - if no index satisfies the equation, return -1
#       - return the smallest acceptable index when there are multiple answers
#     implicit: n/a

# EXAMPLES #

#   [1, 5, 3, 4, 2]
#   to the left of 1 is total 0 - to the right is total 15
#   left of 5 is 1 - right is 9
#   left of 3 is 6 - right is 6
#   get the index of 3 (which is 2)
#   return 2

# DATA STRUCTURES #

#   - Integer
#   - Array

# ALGORITHM #

#   - define a method `equal_sum_index`
#   -- method accepts an Array of Integers `numbers`
#     - iterate the Array with each index and number:
#       - initialize a variable `left_sum` and set to sum of left indices
#       - initialize a variable `right_sum` and set to sum of right indices
#       - return the current index if `left_sum` and `right_sum` are equal
#     - if all numbers iterated, return -1
#   - end method

# CODE #

def equal_sum_index(numbers)
  numbers.each_with_index do |num, idx|
    if idx == 0
      left_sum = 0
      right_sum = numbers[1...numbers.size].sum
    else
      left_sum = numbers[0...idx].sum
      right_sum = numbers[(idx+1)...numbers.size].sum
    end
    return idx if left_sum == right_sum
  end
  -1
end

p equal_sum_index([1, 5, 3, 4, 2])
p equal_sum_index([1, 5, 3, 4, 2]) == 2
puts

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0
puts

# completed in 17 mins 54 secs #
