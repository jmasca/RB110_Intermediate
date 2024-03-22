system 'clear'
# rb119 interview assessment - practice problem 12

=begin
Create a method that takes a string as an argument and returns true if the string is a pangram, false if it is not.

Pangrams are sentences that contain every letter of the alphabet at least once. For example, the sentence "Five quacking zephyrs jolt my wax bed." is a pangram since it uses every letter at least once. Note that case is irrelevant.

p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true

The above tests should each print true.
=end

# PROBLEM #

#   input: String
#   output: Boolean

#   rules:
#     explicit:
#       - method will take a String argument
#       - method will return a Boolean true or false
#       - pangram:
#         - uses every letter of the alphabet at least once
#       - case is irrelevant

# EXAMPLES #

#   use every letter of the alphabet at least once

# DATA STRUCTURES #

#   - String
#   - Boolean
#   - Array

# ALGORITHM #

#   - define a method named `is_pangram`
#   -- method accepts a String argument, `str`
#     - initialize an Array named `alphabet` and set it to hold one element
#       for each letter of the alphabet
#     - iterate the downcased chars of `str`
#       - if the current char is in `alphabet`, delete it
#     - repeat until all chars iterated
#     - return the true or false value of whether `alphabet` is now empty
#   - end method

# CODE #

def is_pangram(str)
  alphabet = Array('a'..'z')
  str.downcase.each_char do |char|
    alphabet.delete(char) if alphabet.include?(char)
  end
  alphabet.empty?
end

p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true
puts

# completed in 10 mins 53 secs #
