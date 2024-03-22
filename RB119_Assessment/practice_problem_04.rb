system 'clear'
# rb119 interview assessment - practice problem 4

=begin
Create a method that takes an array of integers as an argument and returns an array of two numbers that are closest together in value. If there are multiple pairs that are equally close, return the pair that occurs first in the array.

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]

The above tests should each print true.
=end

# PROBLEM #

#   input: Array (of integers)
#   output: Array (of two numbers)

#   rules:
#     explicit:
#       - array of integers given as argument
#       - return an array containing two numbers
#         - the two numbers are the closest together in value
#           (7 is closer to 10 than it is 12)
#       - when multiple pairs are equally close - the pair that
#         occurs first in the array is returned
#     implicit:
#       - given array can be of any size (no max or min elements)

# EXAMPLES #

#   [3, 14, 24, 5, 7]
#   compare 3 with 14, then 24, then 5, then 7
#   [3, 5]
#   compare 14 with 24, 5, 7
#   [14, 7]
#   since 14-7 is greater than 5-3, [3, 5] remains
#   ...
#   [5, 7] are also 2 away, so we keep the first pair
#   return [3, 5]

# DATA STRUCTURES #

#   Array

# ALGORITHM #

#   - define a method named `closest_numbers`
#    (method accepts an array of integers named `numbers`)
#     - initialize an empty array named `closest_pair`
#     - begin iterating the `numbers` array
#       - with each iteration compare the distance/difference in size
#         between the current number and each remaining in the array
#       - whichever pair is the closest together: 
#         - compare this distance with the distance of the pair
#           currently assigned to the `closest_pair` array
#         - if the array is empty, assign the current pair
#         - if the current pair has a distance smaller than the 
#           pair in `closest_pair`, assign the current pair
#         - otherwise, leave the `closest_pair` alone and continue
#           to the next iteration
#     - after all numbers iterated return `closest_pair`
#   - end method

# CODE #
=begin
def closest_numbers(numbers)
  closest_pair = []
  distance = -1

  numbers.each_with_index do |num, idx|
    (idx + 1).upto(numbers.size - 1) do |i|
      tmp_distance = (num - numbers[i]).abs
      if distance == -1 || tmp_distance < distance
        distance = tmp_distance
        closest_pair = [num, numbers[i]]
      end
    end
  end
  closest_pair
end


arr = [3, 14, 24, 5, 7]
closest = [3, 5]

p closest_numbers(arr)
p closest_numbers(arr) == closest
puts

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]
puts
=end
# completed in 34 mins 23 seconds #

### REFACTORED ###

def closest_numbers(numbers)
  number_pairs = []
  numbers.combination(2) { |combo| number_pairs << combo }
  distances_arr = number_pairs.map { |pair| (pair[0] - pair[1]).abs }
  number_pairs[distances_arr.index(distances_arr.min)]
end

arr = [3, 14, 24, 5, 7]
closest = [3, 5]

p closest_numbers(arr)
p closest_numbers(arr) == closest
puts

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]
puts
