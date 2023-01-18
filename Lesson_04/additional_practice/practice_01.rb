system "clear"
# Practice Problem 1:

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn the array into a hash where:
#  - the names are the keys
#  - the values are the positions in the array.

# --------------------------------------------------------------------------- #
puts "#each_with_object:\n"

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash_01 = flintstones.each_with_object({}) do |name, hsh|
                    hsh[name] = flintstones.index(name)
                  end

p flintstones_hash_01

puts puts

# --------------------------------------------------------------------------- #
puts "#loop do:\n"

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash_02 = {}
counter = 0

loop do
  break if counter == flintstones.size
  flintstones_hash_02[flintstones[counter]] = counter
  counter += 1
end

p flintstones_hash_02

puts puts

# --------------------------------------------------------------------------- #
puts "#each_with_index:\n"

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash_03 = {}
flintstones.each_with_index do |name, index|
  flintstones_hash_03[name] = index
end

p flintstones_hash_03

puts puts
# --------------------------------------------------------------------------- #
