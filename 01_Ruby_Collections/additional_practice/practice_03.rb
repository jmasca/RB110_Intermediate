system "clear"
# Practice Problem 3:

# Remove people with age 100 and greater from the ages hash.

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# --------------------------------------------------------------------------- #
puts "#delete_if:"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |k, v| v >= 100 }
p ages

puts puts

# --------------------------------------------------------------------------- #
puts "#keep_if:"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.keep_if { |k, v| v < 100}
p ages

puts puts

# --------------------------------------------------------------------------- #
puts "#select!:"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! { |k, v| v < 100 }
p ages

puts puts

# --------------------------------------------------------------------------- #
