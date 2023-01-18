system "clear"
# Practice Problem 6:

# Change the array so that:
#    - all of the names are shortened to just the first three characters.
# Do not create a new array.

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# --------------------------------------------------------------------------- #
puts "#map!:"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }
p flintstones

puts puts

# --------------------------------------------------------------------------- #
puts "#each and String#slice!:" # not the best

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each { |name| name.slice!(3, 10) } # random number 10 for length

p flintstones

# or

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
length = 0

flintstones.each do |name|
  length = name.size
  name.slice!(3, length) # used the length of the name to end the slice
end

p flintstones

puts puts

# --------------------------------------------------------------------------- #
