# practice_05.rb
system "clear"
# --------------------------------------------------------------------------- #
#
# Question: Determine the total age of just the male members of the family.
# 
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
# 
# --------------------------------------------------------------------------- #

# my solution:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

ages = munsters.map do |_, data|
        data["gender"] == "male" ? data["age"] : 0
      end

puts ages.sum

# --------------------------------------------------------------------------- #

# LS solution:

total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444

# Since we're not referencing the key (each family member's name) from the
# key-value pairs in the outer hash, we can use Hash#each_value with a single
# block parameter.
