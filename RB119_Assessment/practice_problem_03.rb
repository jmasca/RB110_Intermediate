system 'clear'
# rb119_interview_assessment - practice problem 3

#   Create a method that takes a string argument and returns a copy of the
#     string with every second character in every third word converted to
#     uppercase. Other characters should remain the same.

=begin
original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtiNg world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected
=end

# PROBLEM #

#   input: String
#   output: String (copy)

#   rules:
#     explicit:
#       - method accepts a String argument
#       - return a copy (do not modify the original)
#       - every 3 words, change every other char starting at the
#         second character to an uppercase version
#       - all other chars remain the same
#     implicit:
#       - if the 3rd word is a single char, continue without changing

# EXAMPLE #

#   'this is a silly little phrase'
# should become:
#   'this is a silly little pHrAsE'

# DATA STRUCTURES #

#   - String
#   - Array to hold words

# ALGORITHM #

#   - define a method named `to_weird_case`
#     (accepts a String argument named 'og_string')
#     - alter the String into an Array of words
#       (assign the array to a variable named `words`)
#     - iterate to every third word of `words`
#       - if the word is a single char, continue without modifying
#       - otherwise, iterate the chars of that word
#         - make every 2nd char uppercase, beginning w/ the 2nd char
#     - after the entire array has been iterated and every third word
#       has been modified, rejoin the array into a String
#   - return the new String

# CODE #

def to_weird_case(og_string)
  iterations = 0
  words = og_string.split
  words.map! do |word|
    iterations += 1
     if iterations % 3 == 0 && word.size > 1
      iter = -1
      word.chars.map! do |char|
        iter += 1
        if iter.even?
          char
        else
          char.upcase
        end
      end.join
    else
      word
    end
  end
  words.join(' ')
end

original = 'this is a silly little phrase'
expected = 'this is a silly little pHrAsE'
p to_weird_case(original)
puts

original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected

# completed in 35 mins 25 seconds #
# completed while at work - time might be less than accounted for. #
