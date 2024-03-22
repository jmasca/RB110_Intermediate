system 'clear'
# rb119 interview assessment - practice problem 8

=begin
Create a method that takes a non-empty string as an argument. The string consists entirely of lowercase alphabetic characters. The method should return the length of the longest vowel substring. The vowels of interest are "a", "e", "i", "o", and "u".

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5

The above tests should each print true.
=end

# PROBLEM #

#   input: String (non-empty)
#   output: Integer (length of longest vowel substring)

#   rules:
#     explicit:
#       - method that takes a non-empty String
#       - return an Integer representing the longest vowel substring
#       - the given String consist of only lowercase alphabetic chars
#       - the vowels are aeiou

# EXAMPLES #

#   'sequence'
#   -> 'e' => 1
#   -> 'ue' => 2
#   -> 'e' => 1
#   return 2

# DATA STRUCTURES #

#   - String
#   - Integer
#   - Array (hold the vowel substrings)

# ALGORITHM #

#   - define a method named `longest_vowel_substring`
#     -- method accepts a String argument named `string`
#     - initialize an empty Array named `vowel_substrs`
#     - initialize an empty String named `substr`
#     - iterate the chars of `string`
#       - if the current char is a non-vowel, go to the next char
#       - if the current char is a vowel:
#           - check the next char to see if its a vowel
#           - continue until a non-vowel is reached
#           - add the vowel substring to `vowel_substrs`
#     - after all chars in the string are iterated:
#       - find the element in `vowel_substrs` that is the longest
#         - return the length of that substring
#   - end method

# CODE #

def longest_vowel_substring(string)
  vowel_substrs = []
  substr = ''
  max_length = 0

  string.each_char do |char|
    if 'aeiou'.include?(char)
      substr << char
    else
      vowel_substrs << substr unless substr.empty?
      substr = ''
    end
  end

  vowel_substrs << substr unless substr.empty?

  vowel_substrs.each do |subs|
    max_length = subs.size if subs.size > max_length
  end
  max_length
end

p longest_vowel_substring('sequence')
p longest_vowel_substring('sequence') == 2
puts

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5
puts

# completed in 18 mins 49 secs #
