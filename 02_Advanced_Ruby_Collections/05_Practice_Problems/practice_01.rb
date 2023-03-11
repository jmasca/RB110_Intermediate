# practice_01.rb
system "clear"
# --------------------------------------------------------------------------- #
#
# Question: How would you order this array of number strings
#           by descending numeric value?
#
# arr = ['10', '11', '9', '7', '8']
#
# --------------------------------------------------------------------------- #

# my solution:

arr = ['10', '11', '9', '7', '8']

# using the sort_by method
arr_sorted = arr.sort_by { |str| -(str.to_i) }
p arr_sorted

# using the sort method with a block (just use a and b next time)
arr_sort = arr.sort { |str1, str2| str2.to_i <=> str1.to_i }
p arr_sort
