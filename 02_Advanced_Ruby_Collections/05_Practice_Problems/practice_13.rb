# practice_13.rb
system "clear"
# --------------------------------------------------------------------------- #
#
# Question: Given the following data structure, return a new array containing
#           the same sub-arrays as the original but ordered logically by only
#           taking into consideration the odd numbers they contain.
#
# arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]
#
# => [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]
#
# --------------------------------------------------------------------------- #

# my solution:

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

odd_sort = arr.sort_by do |sub_arr|
            sub_arr.select do |element|
              element.odd?
            end
          end

p odd_sort
p odd_sort == [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]
