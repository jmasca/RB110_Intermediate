system 'clear'
# rb119 interview assessment - practice problem 2

=begin
Create a method that takes an array of integers as an argument. The method should return the minimum sum of 5 consecutive numbers in the array. If the array contains fewer than 5 elements, the method should return nil.

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

The above tests should each print true.
=end

# PROBLEM #

#   input: Array (of Integers)
#   output: Integer or nil

#   rules:
#     explicit:
#       - method will accept an Array of Integers
#       - should return the minimum sum of 5 consecutive numbers from the Array
#       - Arrays with fewer than 5 elements should return nil
#     implicit:
#       - positive and negative Integers will be passed to the method
#       - empty should also return nil

# EXAMPLES #

#   [2, 2, 1, 3, 4, 1]
#    .  .  .  .  .
#    2 + 2 + 1 + 3 + 4 = 12
#    2 + 1 + 3 + 4 + 1 = 11
#   11 is the minimum sum of 5 consecutive numbers
#   return 11

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# DATA STRUCTURES #

#   - Array
#   - Integer

# ALGORITHM #

#   - define a method named `minimum sum` that accepts an Array of Integers,
#     `numbers`, as an argument
#     - return nil if the number of elements in `numbers` is less than 5
#     - initialize a variable, `lowest_sum`, and assign it `nil`
#     <> begin by iterating the indices of `numbers`:
#         - calculate the sum of the current indexes number and the next 4
#           numbers in `numbers`
#         - assign the result to `lowest_sum` if the result is less than
#           `lowest_sum` or `lowest_sum` is `nil`
#     >< break from the iteration if the last index included in the addition is
#         equal to the size of `numbers` minus 1
#     - return `lowest_sum`
#   - end method

# CODE #

def minimum_sum(numbers)
  return nil if numbers.size < 5
  lowest_sum = nil

  numbers.each_index do |idx|
    result = numbers[idx..(idx + 4)].sum
    lowest_sum = result if lowest_sum == nil || result < lowest_sum
    break if (idx + 4) == (numbers.size - 1)
  end
  lowest_sum
end

p minimum_sum([2, 2, 1, 3, 4, 1])
p minimum_sum([2, 2, 1, 3, 4, 1]) == 11
puts

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
puts

# completed in 26 mins 51 secs #
