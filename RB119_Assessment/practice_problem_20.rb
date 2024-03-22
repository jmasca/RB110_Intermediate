system 'clear'
# rb119 interview assessment - practice problem 20

=begin
Create a method that takes an array of numbers, all of which are the same except one. Find and return the number in the array that differs from all the rest.

The array will always contain at least 3 numbers, and there will always be exactly one number that is different.

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3

The above tests should each print true.
=end

# PROBLEM #

#   input: Array (of Integers)
#   output: Integer (the only Integer that appears once)

#   rules:
#     explicit:
#       - method will accept an Array of Integers
#       - return value will be an Integer from the Array
#       - all Integers are the same value except for one
#       - find the Integer that appears only once
#       - the Array will always contain at least 3 numbers
#       - there will always be exactly one number that is different
#     implicit: n/a

# EXAMPLES #

#   [33, 9, 33, 33]
#   -> 9 appears only one time
#   -> return 9

# DATA STRUCTURES #

#   - Integer
#   - Array

# ALGORITHM #

#   - define a method `what_is_different`
#   -- method accepts an Array of integers, `numbers`
#     - iterate the numbers of the array:
#     - if the number only appears one time in the original array, return it
#   - end method

# CODE #

def what_is_different(numbers)
  numbers.select { |num| numbers.count(num) == 1 }.first
end

p what_is_different([33, 9, 33, 33])
p what_is_different([33, 9, 33, 33]) == 9
puts

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3
puts

# completed in 5 mins 53 secs #
