system "clear"
# Practice Problem 5:

# Find the index of the first name that starts with "Be".

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# --------------------------------------------------------------------------- #
puts "#each_with_index:"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index { |name, i | puts i if name.start_with?("Be") }

puts puts

# --------------------------------------------------------------------------- #
puts "#index:"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts "String#start_with?:"
p flintstones.index { |name| name.start_with?("Be") }

puts "\nString#slice:"
p flintstones.index { |name| name[0, 2] == "Be" }

puts puts

# --------------------------------------------------------------------------- #
