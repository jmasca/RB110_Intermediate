system 'clear'
# rb119 interview assessment - practice problem 13

=begin
Create a method that takes two strings as arguments and returns true if some portion of the characters in the first string can be rearranged to match the characters in the second. Otherwise, the method should return false.

You may assume that both string arguments only contain lowercase alphabetic characters. Neither string will be empty.

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true

The above tests should each print true.
=end

# PROBLEM #

#   input: Strings (two string arguments)
#   output: Boolean (true or false)

#   rules:
#     explicit:
#       - method accepts two String arguments
#       - returns Boolean true or false
#       - a portion of String1 must be able to be rearranged to match String2
#       (all chars of String2 must be within String1)
#       - return false otherwise
#       - both Strings will only contain lowercase alphabetice chars
#       - there will be no empty Strings

# EXAMPLES #

#   'dtoffgrw', 'frog'
#   -> 'f' -> count of f's in `frog` == 1
#   -> there's at least 1 `f` in 'dtoffgrw'
#   -> continuing through all of `frog` the return value is true

# DATA STRUCTURES #

#   - String

# ALGORITHM #

#   - define a method named `unscramble`
#   -- `unscramble` accepts two String arguments `str1` and `str2`
#     - begin by iterating each char of `str2`
#       - for each char, count the occurrences:
#         - initialize a variable `occurrences` and set to the result
#       - if `str1` contains at least `occurrences` number of current char:
#         - continue to the next char
#       - otherwise return false
#     - if all chars iterated
#     - return true
#   - end method

# CODE #

def unscramble(str1, str2)
  str2.each_char do |char|
    next if str2.count(char) <= str1.count(char)
    return false
  end
  true
end

p unscramble('dtoffgrw', 'frog')
p unscramble('dtoffgrw', 'frog') == true

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true
puts

# completed in 12 mins 46 secs #
