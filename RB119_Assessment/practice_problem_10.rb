system 'clear'
# rb119 interview assessment - practice problem 10

=begin
Create a method that takes a string of digits as an argument and returns the number of even-numbered substrings that can be formed. For example, in the case of '1432', the even-numbered substrings are '14', '1432', '4', '432', '32', and '2', for a total of 6 substrings.

If a substring occurs more than once, you should count each occurrence as a separate substring.

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12

The above tests should each print true.
=end

# PROBLEM #

#   input: String (of digits)
#   output: Integer (number of even-numbered substrings)

#   rules:
#     explicit:
#       - method that accepts a String argument
#       - the String will consist of only digits
#       - return the number of even-numbered substrings
#       - multiple occurrences are counted separately
#     implicit:
#       - at least one char long; no empty Strings

# EXAMPLES #

#   '275483'
#   '2'
#   '2754'
#   '27548'
#   '754'
#   '7548'
#   '54'
#   '548'
#   '4'
#   '48'
#   '8'
#   => return 10

# DATA STRUCTURES #

#   - String
#   - Integer
#   - Array (hold substrings)

# ALGORITHM #

#   - define a method named `even_substrings`
#   -- method accepts a String argument named `digits`
#     - initialize an empty Array named `even_substr`
#     - break `digits` into all possible substrings
#       - iterate a char of `digits`
#         - iterate from the current_index to the end of `digits`
#         - add each successive substring to `even_substr` if even
#     - if the current substring is even, add it to `even_substr`
#     - return the size of `even_substr`
#   - end method

# CODE #
# ************* I need to memorize how to populate all substrings *************

def even_substrings(digits)
  substrings = []
  (0...digits.size).each do |first_idx|
    (first_idx...digits.size).each { |sec_idx| substrings << digits[first_idx..sec_idx] }
  end

  substrings.select! { |sub| sub.to_i.even? }
  substrings.count
end

p even_substrings('275483')
p even_substrings('275483') == 10
puts

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12
puts
