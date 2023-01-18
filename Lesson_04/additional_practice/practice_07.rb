system "clear"
# Practice Problem 7:

# Create a hash that:
#    - expresses the frequency with which each letter occurs in this string:

# statement = "The Flintstones Rock"

# split into array
# get unique elements
# tally from map

# --------------------------------------------------------------------------- #
puts "my solution:"

statement = "The Flintstones Rock"
letters = statement.delete(" ").split('').sort!

letters_hash = {}

letters.each do |letter|
  next if letters_hash.include?(letter)
  letters_hash[letter] = letters.count(letter)
end

p letters_hash


puts puts

# --------------------------------------------------------------------------- #
puts "#launch school solution:"

statement = "The Flintstones Rock"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

puts puts

# --------------------------------------------------------------------------- #
