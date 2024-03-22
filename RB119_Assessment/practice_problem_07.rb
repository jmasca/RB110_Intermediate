system 'clear'
# rb119 interview assessment - practice problem 7

=begin
Create a method that takes an array of integers as an argument and returns the number of identical pairs of integers in that array. For instance, the number of identical pairs in [1, 2, 3, 2, 1] is 2: there are two occurrences each of both 2 and 1.

If the array is empty or contains exactly one value, return 0.

If a certain number occurs more than twice, count each complete pair once. For instance, for [1, 1, 1, 1] and [2, 2, 2, 2, 2], the method should return 2. The first array contains two complete pairs while the second has an extra 2 that isn't part of the other two pairs.

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3

The above tests should each print true.
=end

# PROBLEM #

#   input: Array (of integers)
#   output: Integer (number of identical pairs)

#   rules:
#     explicit:
#       - method accepts an Array of integers
#       - return the number of identical pairs
#         - identical pair means the same number appearing twice
#       - if the same number appears more than twice:
#         - each set of two is considered a pair
#       - empty Arrays or single element Arrays return 0

# EXAMPLES #

#   [2, 3, 2, 2, 5]
#   -> 2 appears 3 times -> 3/2 is 1 pair
#   -> 3 appears once
#   -> 5 appears once
#   => the return value is 1

# DATA STRUCTURES #

#   - Array
#   - Hash (keep track of occurrences)
#   - Integer

# ALGORITHM #

#   - define a method named `pairs` that accepts (1) argument
#   - the argument is an Array of integers named `numbers`
#     - initialize an empty Hash named `number_frequency`
#     - initialize a variable named `num_of_pairs` and set to 0
#     - iterate each number in the `numbers` array
#         - in the Hash `number_frequency`:
#           - if there's a key for this number already, go to the next number
#           - otherwise, set the number as a key and its count as the value
#     - iterate the values of `number_frequency`:
#       - divide each value by two and increase `num_of_pairs` by that many
#     - return `num_of_pairs`
#   - end method

# CODE #

def pairs(numbers)
  number_frequency = {}
  num_of_pairs = 0

  numbers.each do |num|
    next if number_frequency.key?(num)
    number_frequency[num] = numbers.count(num)
  end

  number_frequency.values.each do |n|
    num_of_pairs += (n / 2)
  end
  num_of_pairs
end

p pairs([2, 3, 2, 2, 5])
p pairs([2, 3, 2, 2, 5]) == 1
puts

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3
puts

# completed in 14 mins 28 secs #
