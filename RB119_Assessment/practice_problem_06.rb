system 'clear'
# rb119 interview assessment - practice problem 6

=begin
Create a method that takes a string argument and returns a hash in which the keys represent the letters in the string, and the values represent how often the corresponding letter occurs in the string.

expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
p count_letters('woebegone') == expected

expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
            'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
p count_letters('lowercase/uppercase') == expected

expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == {'x' => 1}
p count_letters('') == {}
p count_letters('!!!') == {}

The above tests should each print true.
=end

# PROBLEM #

#   input: String
#   output: Hash

#   rules:
#     explicit:
#       - method accepts a String argument
#       - returns a Hash
#         - each key is a letter in the given String
#         - each value is the number of times the letter appears in String
#     implicit:
#       - only letters are being added to the Hash (punctuation is ignored)
#       - uppercase letters are also ignored
#       - ONLY LOWERCASE LETTERS FROM THE STRING ARE COUNTED/ADDED TO HASH *
#       - empty Strings return an empty Hash

# EXAMPLES #

#   'Froggy!'
#   -> 'F' is ignored (uppercase)
#   -> 'r' is added to hash and counted => {'r' => 1}
#   -> 'o' is added and counted => {'r' => 1, 'o' => 1}
#   -> 'g' is added and counted => {'r' => 1, 'o' => 1, 'g' => 2 }
#   -> 'y' is added and counted => {'r' => 1, 'o' => 1, 'g' => 2, 'y' => 1 }
#   -> '!' is ignored (punctuation)
#   => return {'r' => 1, 'o' => 1, 'g' => 2, 'y' => 1 }

# DATA STRUCTURES #

#   - String
#   - Hash
#   - Array (to hold lowercase alphabet)

# ALGORITHM #

#   - define a method named `count_letters`
#     -- method accepts a String argument `string`
#     - initialize an empty Hash named `letter_count`
#     - initialize an Array `lowercase_alphabet` to all lowercase letters
#     - iterate each char in `string`
#       - if the char exists in `lowercase_alphabet` go to next char
#       - otherwise, add char as key and count its occurrences for the value
#     - continue until the entirety of `string` has been iterated
#     - return the Hash `letter_count`
#   - end method

# CODE #

def count_letters(string)
  lowercase_alphabet = Array('a'..'z')
  letter_count = {}
  string.each_char do |char|
    next unless lowercase_alphabet.include?(char)
    next if letter_count.key?(char)
    letter_count[char] = string.count(char)
  end
  letter_count
end

p count_letters('Froggy!')
p count_letters('Froggy!') == {'r' => 1, 'o' => 1, 'g' => 2, 'y' => 1 }
puts

expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
p count_letters('woebegone') == expected

expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
            'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
p count_letters('lowercase/uppercase') == expected

expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == {'x' => 1}
p count_letters('') == {}
p count_letters('!!!') == {}
puts

# completed in 16 mins 36 secs #
