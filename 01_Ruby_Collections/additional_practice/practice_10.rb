system "clear"
# Practice Problem 10:
# adding a key-value pair to the inner hash

# --------------------------------------------------------------------------- #
puts "Practice Problem 10:\n\n"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, bio|

  case bio["age"]
  when (0..17)
    munsters[name]["age_group"] = "kid"
  when (18..64)
    munsters[name]["age_group"] = "adult"
  else
    munsters[name]["age_group"] = "senior"
  end
end

munsters.each do |name, bio|
  puts name
  puts bio
  puts
end

# --------------------------------------------------------------------------- #
puts puts
