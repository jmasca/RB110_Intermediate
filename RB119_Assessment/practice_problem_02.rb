system 'clear'
# rb119_interview_assessment - practice problem 2

# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".

# PROBLEM #

#  - given an array of integers, return the minimum sum of 5
#    consecutive numbers in the array
 
#  input: Array of Integers
#  output: Integer or nil

#  rules:
#   explicit:
#     - method accepts one argument (an array of integers)
#     - return the minimum sum of 5 consecutive numbers
#     - fewer than 5 elements returns nil
#   implicit:
#     - minimum sum of 5 consecutive numbers:
#       - 5 consecutive numbers with the lowest overall total sum

# EXAMPLES #

# [2, 5, 8, 1, 3, 4]
#   -> (5) -> 2 + 5 + 8 + 1 + 3 = 19
#   -> (5) -> 5 + 8 + 1 + 3 + 4 = 21
# return 19

# DATA STRUCTURE #

#   - Array
#   - Integer

# ALGORITHM #

#   - define a method named `minimum_sum`
#     (the method accepts one argument `num_arr`)
#     - if there are less than 5 elements, return nil
#     - initialize a variable named `lowest_sum` to 0
#     - begin iterating the array:
#       - with the current number, add this to the next 4 nums
#         - if `lowest_sum` is 0, assign the total to `lowest_sum`
#         - otherwise, compare the total with the number in `lowest_sum`
#         - assign the lowest value to `lowest_sum`
#     - repeat until there are no more conscutive 5 number runs
#   - return `lowest_sum``

# CODE # 

def minimum_sum(num_arr)
  return nil if num_arr.size < 5
  lowest_sum = 0

  num_arr.each_index do | idx |
    break if idx + 5 > (num_arr.size - 1)
    total = 0
    idx.upto(idx + 4) { |i| total += num_arr[i] }
    lowest_sum = total if total < lowest_sum || lowest_sum == 0
  end
  lowest_sum
end

p minimum_sum([2, 5, 8, 1, 3, 4])

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
puts
