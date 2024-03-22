system 'clear'
# rb119 interview assessment - practice problem 9

=begin
Create a method that takes two string arguments and returns the number of times that the second string occurs in the first string. Note that overlapping strings don't count: 'babab' contains 1 instance of 'bab', not 2.

You may assume that the second argument is never an empty string.

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1

The above tests should each print true.
=end

# PROBLEM #

#   input: (2) Strings
#   output: Integer (number of times the second String appears in the first)

#   rules:
#     explicit:
#       - create a method that takes two String arguments
#       - return the number of times the second String appears in the first
#       - overlapping Strings are ignored, must be the full String
#       - the second String is never empty
#     implicit:
#       - the first String can be empty, in this case a 0 is returned

# EXAMPLES #

#   ('pouring', 'our')
#   'our' appears once => 1

# DATA STRUCTURES #

#   - String
#   - Integer

# ALGORITHM #

#   - define a method named `count_substrings`
#     -- method accepts two String arguments `str` and `substr`
#     - replace each occurence of `substr` in `str` with a `1`
#     - return the number of '1's in `str` 

# CODE #
=begin
def count_substrings(str, substr)
  str.gsub(substr, '1').count('1')
end

p count_substrings('pouring', 'our')
p count_substrings('pouring', 'our') == 1
puts

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1
puts
=end
# completed in 10 mins 21 secs #

### REFACTORED USING #SCAN ###

def count_substrings(str, substr)
  str.scan(substr).count
end

p count_substrings('pouring', 'our')
p count_substrings('pouring', 'our') == 1
puts

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1
puts
=begin
### MANUALLY CREATE SUBSTRING ARRAY ###
substrings = []
(0...str.size).each do |s_idx|
  (s_idx...str.size).each { |e_idx| substrings << str[s_idx..e_idx] }
end
=end
