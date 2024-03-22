system 'clear'
# rb119_interview_assessment - practice problem 1

# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
#                            == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".

# PROBLEM #
#   find out how many numbers in the given array are smaller than each number

#   input: Array
#   output: Array

#   rules:
#     explicit:
#       - given an array of numbers
#       - for each UNIQUE number, determine how many numbers are
#         smaller than it within the array
#     implicit:
#       - return an array with results corresponding to number idx

# EXAMPLES #

#   [5, 2, 7, 1, 1]
#   smaller than 5 -> 2, 1 -> 2 total numbers => [2]
#   smaller than 2 -> 1 -> 1 total number => [2, 1]
#   smaller than 7 -> 5, 2, 1 -> 3 total numbers => [2, 1, 3]
#   smaller than 1 -> 0 -> no numbers => [2, 1, 3, 0, 0]
#   returned array => [2, 1, 3, 0, 0]

# DATA STRUCTURES #

#   - Array

# ALGORITHM #

# - define a method named `smaller_numbers_than_current`
#   - the method accepts an array of numbers named `numbers`
#   - initialize an empty results array called
#     `count_of_numbers_smaller`
#   - beginning iterating through each number:
#     - initialize a counter variable called `count`
#     - for the current number:
#       - compare to each other unique number in the array
#       - if the current number is larger, incremement `count`
#     - add `count` to the array `count_of_smaller_numbers`
#   - return `count_of_smaller_numbers`

# CODE #

def smaller_numbers_than_current(numbers)
  numbers.map do |num|
    numbers.uniq.count { |n| num > n }
  end
end

p smaller_numbers_than_current([5, 2, 7, 1, 1])

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
puts

# completed in 17 mins 48 seconds #
