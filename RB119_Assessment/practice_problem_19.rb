system 'clear'
# rb119 interview assessment - practice problem 19

=begin
Create a method that takes an array of integers as an argument and returns the integer that appears an odd number of times. There will always be exactly one such integer in the input array.

p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0

The above tests should each print true.
=end

# PROBLEM #

#   input: Array (of Integers)
#   output: Integer (the one that appears an odd number of times)

#   rules:
#     explicit:
#       - method accepts an Array of Integers
#       - method returns one of the Integers from the given Array
#         - Integer must be the one that appears an odd number of times
#       - only one such Integer will appear an odd number of times
#     implicit: n/a

# EXAMPLES #

#   [3, 3, 4, 5, 5]
#   -> 3 appears twice
#   -> 4 appears once
#   -> 5 appears twice
#   -> 4 has an odd number of appearances
#   return 4

# DATA STRUCTURES #

#   - Integer
#   - Array

# ALGORITHM #

#   - define a method `odd_fellow` that accepts an Array `numbers`
#     - initialize a new Array `singles` that holds only one of 
#       each number from `numbers`
#     - iterate `singles`:
#       - for each number, count the appearances it has in `numbers`
#       - if the number of appearances is odd, return this number
#   - end method

# CODE #

def odd_fellow(numbers)
  singles = numbers.uniq
  singles.each do |num|
    return num if numbers.count(num).odd?
  end
end

p odd_fellow([3, 3, 4, 5, 5])
p odd_fellow([3, 3, 4, 5, 5]) == 4
puts

p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0
puts

# completed in 7 mins 58 secs #
