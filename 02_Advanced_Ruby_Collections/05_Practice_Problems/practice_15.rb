# practice_15.rb
system "clear"
# --------------------------------------------------------------------------- #
#
# Question: Given this data structure write some code to return an array which
#           contains only the hashes where all the integers are even.
#
# arr =
#   [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
#
# --------------------------------------------------------------------------- #

# my solution:

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

evens = arr.select do |hsh|
          hsh.values.flatten.all? { |e| e.even? }
        end

p evens
puts evens == [{:e=>[8], :f=>[6, 10]}]

# --------------------------------------------------------------------------- #

# LS solution: nested #all? blocks

ev = arr.select do |hsh|
       hsh.all? do |_, value|
         value.all? do |num|
           num.even?
         end
       end
     end
p ev
puts ev == [{:e=>[8], :f=>[6, 10]}]
