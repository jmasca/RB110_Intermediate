system 'clear'
# rb119 interview assessment - practice problem 14

=begin
Create a method that takes a single integer argument and returns the sum of all the multiples of 7 or 11 that are less than the argument. If a number is a multiple of both 7 and 11, count it just once.

For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 21, and 22. The sum of these multiples is 75.

If the argument is negative, return 0.

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0

The above tests should each print true.
=end

# PROBLEM #

#   input: Integer
#   output: Integer

#   rules:
#     explicit:
#       - method takes a single Integer argument
#       - return the sum of all multiples of 7 and 11 that are < the number
#       - if a number is a multiple of 7 and 11, count it only once
#       - if the number is negative return 0

# EXAMPLES #

#   12 -> 7 and 11 are the only multiples of 7 or 11 that are less than 12
#   7 + 11 = 18
#   return 18

# DATA STRUCTURES #

#   - Integer

# ALGORITHM #

#   - define a method named `seven_eleven`
#   -- method accepts and Integer argument `num`
#     - return 0 if `num` is less than 7
#     - initialize an Integer variable `total_sum` and set to 0
#     - beginning at 7 add this number to `total_sum`
#     - iterate through all numbers up to `num` -> (num - 1)
#       - for each number check if its a multiple of 7 or 11
#       - if it is then add it to `total_sum`
#       - otherwise, go to the next number
#     - return `total_sum`
#   - end method

# CODE #

def seven_eleven(num)
  return 0 if num < 7
  total_sum = 0
  7.upto(num - 1) { |n| total_sum += n if n % 7 == 0 || n % 11 == 0 }
  total_sum
end

p seven_eleven(12)
p seven_eleven(12) == 18
puts

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0
puts

# completed in 11 mins 04 secs #
