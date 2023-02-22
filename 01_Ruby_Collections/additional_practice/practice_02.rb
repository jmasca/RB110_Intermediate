system "clear"
# Practice Problem 2:

# Add up all of the ages from the Munster family hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
#        "Marilyn" => 22, "Spot" => 237 }

# --------------------------------------------------------------------------- #
puts "#each_value:"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
       "Marilyn" => 22, "Spot" => 237 }

total_ages = 0
ages.each_value { |value| total_ages += value }

p total_ages

puts puts

# --------------------------------------------------------------------------- #
puts "#values#inject:"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
       "Marilyn" => 22, "Spot" => 237 }

puts ages.values.inject(:+)

puts puts

# --------------------------------------------------------------------------- #
