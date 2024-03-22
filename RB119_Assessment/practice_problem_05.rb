system 'clear'
# rb 119 interview assessment - practice problem 5

=begin
Create a method that takes a string argument and returns the character that occurs most often in the string. If there are multiple characters with the same greatest frequency, return the one that appears first in the string. When counting characters, consider uppercase and lowercase versions to be the same.

p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'

The above tests should each print true.
=end

# PROBLEM #

#   input: String
#   output: String (a single character)

#   rules:
#     explicit:
#       - method will be accepting a String argument
#       - return the character that occurs most often
#         (if multiple chars have the same frequency, return the
#           char that occurs first)
#       - not case-sensitive (r == R)
#     implicit:
#       - all strings given are at least one char in length
#       - returned chars are always lowercase

# EXAMPLES #

#   'Salsa'
#   # downcase word before beginning to count
#   's' => 2 
#   'a' => 2
#   'l' => 1
#   # ignore chars that are already counted
#   return 'S'

# DATA STRUCTURES #

#   - String
#   - Hash

# ALGORITHM #

#   - define a method named `most_common_char`
#     -- method accepts a String argument `string`
#     - initialize a hash named `char_count`
#     - begin iterating each char of `string`
#       - add current char to the hash `char_count` as a key
#       - if the current char is already a key, go to the next char
#       - count the number of occurrences and assign the result as the
#         value to the current char in the hash `char_count`
#     - after all chars counted, return the highest values key
#       (if two are equal, return the first one that occurred)
#   - end the method

# CODE #

def most_common_char(string)
  all_lower = string.downcase
  char_count = {}
  all_lower.each_char do |char|
    next if char_count.key?(char)
    char_count[char] = all_lower.count(char)
  end

  char_count.key(char_count.values.max)
end

p most_common_char('Salsa')
p most_common_char('Salsa') == 's'
puts

p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'
puts
