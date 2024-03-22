system 'clear'
# rb119 interview assessment - practice problem 17

=begin
Create a method that takes an array of integers as an argument. The method should determine the minimum integer value that can be appended to the array so the sum of all the elements equal the closest prime number that is greater than the current sum of the numbers. For example, the numbers in [1, 2, 3] sum to 6. The nearest prime number greater than 6 is 7. Thus, we can add 1 to the array to sum to 7.

Notes:
The array will always contain at least 2 integers.
All values in the array must be positive (> 0).
There may be multiple occurrences of the various numbers in the array.

p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2) == 4

The above tests should each print true.
=end

# PROBLEM #

#   input: Array (of Integers)
#   output: Integer (minimum value for total sum to equal nearest prime number)

#   rules:
#     explicit:
#       - method accepts an Array of Integers
#       - method will return an Integer value:
#         - minimum value that can be added to total sum to equal nearest prime
#       - Array will always contain at least two Integers
#       - all Array values will be greater than 0 (positive)
#       - multiple occurrences of one Integer is possible
#     implicit: n/a

# EXAMPLES #

#   [2, 4, 6] => total_sum is 12
#   13 is the nearest prime number
#   13 - 12 = 1
#   return 1

# DATA STRUCTURES #

#   - Integer
#   - Array

# ALGORITHM #

#   - define a method, `nearest_prime_sum`
#   -- method accepts an Array argument, `numbers`
#     - initialize a variable `total_sum` to the sum of all elements in `numbers`
#     - initialize a variable `nearest_prime` and set to 0
#     - beginning from `total_sum`:
#       - find the nearest prime number:
#         - number must only be divisible by 1 and itself (2 up to Self - 1)
#         - set this number to the variable `nearest_prime`
#       - subtract `total_sum` from `nearest_prime`
#     - return the result of the subtraction
#   - end method

# CODE #

def nearest_prime_sum(numbers)
  nearest_prime = 0
  total_sum = numbers.sum

  ((total_sum + 1)..).each do |n|
    prime = true
    2.upto(total_sum - 1) do |divisor|
      if n % divisor == 0
        prime = false
        break
      end
    end
    nearest_prime = n if prime
    break if nearest_prime > 0
  end
  nearest_prime - total_sum
end

p nearest_prime_sum([2, 4, 6])
p nearest_prime_sum([2, 4, 6]) == 1
puts

p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4
puts

# completed in 25 mins 37 secs #
