# practice_10.rb
system "clear"
# --------------------------------------------------------------------------- #
#
# Question: Given the following data structure and without modifying the
#           original array, use the map method to return a new array identical
#           in structure to the original but where the value of each integer
#           is incremented by 1.
#
# [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
#
#
# --------------------------------------------------------------------------- #

# my solution:

data_struct = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

incremented = data_struct.map do |sub_hash|
                sub_hash.to_h { |key, value| [key, value + 1] }
              end

p incremented
p incremented == [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]
puts
p data_struct
p data_struct == [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# --------------------------------------------------------------------------- #

# LS Solution:

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]
