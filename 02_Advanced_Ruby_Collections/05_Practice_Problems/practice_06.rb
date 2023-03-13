# practice_06.rb
system "clear"
# --------------------------------------------------------------------------- #
#
# Question: Given this previously seen family hash, print out the name, age
#           and gender of each family member:
#
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
#
# e.g. (Name) is a (age)-year-old (male or female).
#
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

munsters.each do |name, details|
  puts "#{name} is a #{details["age"]}-year-old #{details["gender"]}."
end

# OR #
puts #
# OR #

munsters.each_pair do |name, details|
  puts "#{name} is a #{details["age"]}-year-old #{details["gender"]}."
end
