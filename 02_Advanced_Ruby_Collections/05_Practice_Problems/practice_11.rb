# practice_11.rb
system "clear"
# --------------------------------------------------------------------------- #
#
# Question: Given the following data structure use a combination of methods,
#           including either the select or reject method, to return a new
#           array identical in structure to the original but containing only
#           the integers that are multiples of 3.
#
# arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]
#
# => [[], [3, 12], [9], [15]]
#
# --------------------------------------------------------------------------- #

# my solution:

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

arr_of_3s = arr.map do |sub_arr|
              sub_arr.select do |e|
                e % 3 == 0
              end
            end

p arr
p arr == [[2], [3, 5, 7, 12], [9], [11, 13, 15]]
puts
p arr_of_3s
p arr_of_3s == [[], [3, 12], [9], [15]]
