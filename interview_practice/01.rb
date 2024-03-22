system 'clear'
# rb119 interview assessment - practice problem 1

=begin
Create a method that takes an array of numbers as an argument. For each number, determine how many numbers in the array are smaller than it, and place the answer in an array. Return the resulting array.

When counting numbers, only count unique values. That is, if a number occurs multiple times in the array, it should only be counted once.

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result

The above tests should each print true.
=end

# PROBLEM #

#   input: Array (of Integers)
#   output: Array

#   rules:
#     explicit:
#       - method accepts an Array argument
#       - for each of the numbers in the given Array:
#         - determine how many numbers in the Array are smaller than it
#         - place each answer in an Array
#       - return the Array containing all answers
#       - when counting numbers smaller than current, count values only once:
#         - if a number appears multiple times, its only counted one time
#     implicit:
#       - the given Array will always have at least one element

# EXAMPLES #

#   [12, 10, 4, 9]
#   12 -> smaller numbers: 10, 4, 9 => place 3 into Array => [3]
#   10 -> smaller numbers: 4, 9 => place 2 into Array => [3, 2]
#   4 -> smaller numbers: none => place 0 into Array => [3, 2, 0]
#   9 -> smaller numbers: 4 => place 1 into Array => [3, 2, 0, 1]
#   return => [3, 2, 0, 1]

# DATA STRUCTURES #

#   - Array
#   - Integer

# ALGORITHM #

#   - define a method `smaller_numbers_than_current` that will accept an Array
#     argument consisting of Integers, Array argument is named `numbers`
#     - initialize an empty Array `counts_array` to hold the result
#       of counts
#     <> begin to iterate `numbers` with each number being `current_number`:
#       - initialize a count variable `smaller_numbers_count` to 0
#       <> begin an iteration through only the unique numbers of `numbers` --
#           (each number can only be counted once) and each number in this
#           iteration will be called `comparison_number`:
#         - if `comparison_number` is smaller than `current_number` then
#            increase `smaller_numbers_count` by 1
#         - repeat for all unique numbers
#       >< end inner iteration
#       - insert `smaller_numbers_count` into the Array `counts_array`
#       - repeat for each number of `numbers`
#     >< end outer iteration
#     - return `counts_array`
#   - end method

# CODE #

def smaller_numbers_than_current(numbers)
  counts_array = []
  numbers.each do |current_num|
    smaller_numbers_count = 0
    numbers.uniq.each do |comparison_num|
      smaller_numbers_count += 1 if comparison_num < current_num
    end
    counts_array << smaller_numbers_count
  end
  counts_array
end

p smaller_numbers_than_current([12, 10, 4, 9])
p smaller_numbers_than_current([12, 10, 4, 9]) == [3, 2, 0, 1]
puts

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
puts
