system 'clear'
# rb119 interview assessment - practice problem 16

=begin
Create a method that returns the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. You may assume that the input string contains only alphanumeric characters.

p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5

The above tests should each print true.
=end

# PROBLEM #

#   input: String
#   output: Integer

#   rules:
#     explicit:
#       - method accepts a String of only alphanumeric chars
#       - return the count of distinct chars that occur more than once

# EXAMPLES #

#   'eerie'
#   'e' -> {'e'=>1}
#   'e' -> {'e'=>2}
#   'r' -> {'e'=>2, 'r'=>1}
#   'i' -> {'e'=>2, 'r'=>1, 'i'=>1}
#   'e' -> {'e'=>3, 'r'=>1, 'i'=>1}
#   values > 1 => 'e' is the only one
#   return 1

# DATA STRUCTURES #

#   - String
#   - Integer
#   - Hash

# ALGORITHM #

#   - define a method named `distinct_multiples`
#   -- method accepts a String argument `str`
#     - initialize an empty Hash to hold counts, `occurrences`
#     - iterate each char of `str`:
#       - add the current char as a key to `occurrences`
#         - the value of the initial key entry will be 1
#       - if the key already exists, increment the value by 1
#     - return the count of keys that have a value greater than 1
#   - end method

# CODE #

def distinct_multiples(str)
  occurrences = {}
  str.each_char do |char|
    if occurrences.key?(char.downcase)
      occurrences[char.downcase] += 1
    else
      occurrences[char.downcase] = 1
    end
  end
  occurrences.values.select { |v| v > 1 }.size
end

p distinct_multiples('eerie')
p distinct_multiples('eerie') == 1
puts

p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5
puts

# completed in 15 mins 27 secs #
