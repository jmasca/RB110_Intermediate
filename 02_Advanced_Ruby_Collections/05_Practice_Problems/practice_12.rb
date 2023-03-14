# practice_12.rb
system "clear"
# --------------------------------------------------------------------------- #
#
# Question: Given the following data structure, and without using the
#           Array#to_h method, write some code that will return a hash where
#           the key is the first item in each sub array and the value is the #           second item.
#
# arr = 
#  [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
#
# expected return value:
#   {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
#
#
# --------------------------------------------------------------------------- #

# my solution:

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}
arr.each do |k, v|
  hsh[k] = v
end

p hsh
p hsh == {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# --------------------------------------------------------------------------- #

# LS Solution:

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
hsh # => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
