system "clear"
# Practice Problem :
# create a version of the rails "titleize" implementation.

# use -> words = "the flintstones rock"

# --------------------------------------------------------------------------- #
puts "my version of the rails 'titleize' implementation:\n"

words = "the flintstones rock"

titleized = words.split.map { |word| word.capitalize }.join(' ')

p words
p titleized

puts puts

# --------------------------------------------------------------------------- #
