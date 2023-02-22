system "clear"
# Practice Problem 4:

# Pick out the minimum age from the ages hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
#        "Marilyn" => 22, "Spot" => 237 }

# --------------------------------------------------------------------------- #
puts "#select:"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
       "Marilyn" => 22, "Spot" => 237 }
minimum_age = ages.values.first

ages.select do |k, v|
  current_age = v
  minimum_age = current_age if current_age < minimum_age
end

p minimum_age

puts puts

# --------------------------------------------------------------------------- #
puts "#values#min:"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
       "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

puts puts

# --------------------------------------------------------------------------- #
