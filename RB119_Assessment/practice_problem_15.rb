system 'clear'
# rb119 interview assessment - practice problem 15

=begin
Create a method that takes a string argument that consists entirely of numeric digits and computes the greatest product of four consecutive digits in the string. The argument will always have more than 4 digits.

p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6

The above tests should each print true.
=end

# PROBLEM #

#   input: String (numeric digits only)
#   output: Integer

#   rules:
#     explicit:
#       - method takes a String argument
#       - method returns an Integer
#         - the greatest product of four consecutive digits from the String
#       - the argument will always have 5 or more digits

# EXAMPLES #

#   12345
#   1*2*3*4 => 24
#   2*3*4*5 => 120
#   return 120

# DATA STRUCTURES #

#   - String
#   - Integer
#   - Array (to hold products)

# ALGORITHM #

#   - define a method `greatest_product` that accepts a String argument `digits`
#     - initialize an empty Array `products`
#     - beginning with 0-3 indexes -> [0, 1, 2, 3]
#       - convert String chars to Integers
#       - multiply the elements and place the result into `products`
#       - move to the next set of four digits
#       - repeat until the (length of `digits` - 4) are iterated
#     - return the max number in `products`
#   - end method

# CODE #

def greatest_product(digits)
  products = []
  last_idx = 3

  0.upto(digits.length - 4) do |first_idx|
    numbers_arr = digits.slice(first_idx..last_idx).chars.map { |c| c.to_i }
    products << numbers_arr.inject(:*)
    last_idx += 1
  end
  products.max
end

p greatest_product('12345')
p greatest_product('12345') == 120
puts

p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6
puts

# completed in 30 mins 24 secs #
# longer to complete because I did sum instead of product in my code at first #
