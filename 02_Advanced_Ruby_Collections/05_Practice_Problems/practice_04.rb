# practice_04.rb
system "clear"
# --------------------------------------------------------------------------- #
#
# Question: For each of these collection objects where the value 3 occurs,
#           demonstrate how you would change this to 4.
# 
#
# arr1 = [1, [2, 3], 4]
# 
# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# 
# hsh1 = {first: [1, 2, [3]]}
# 
# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
#
#
# --------------------------------------------------------------------------- #

# my solution:

arr1 = [1, [2, 3], 4]
print "arr1 (before): "; p arr1

arr1[1][1] = 4
print "arr1  (after): "; p arr1; puts

# ------------------------------------------------------

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
print "arr2 (before): "; p arr2

arr2[2] = 4
print "arr2  (after): "; p arr2; puts

# ------------------------------------------------------

hsh1 = {first: [1, 2, [3]]}
print "hsh1 (before): "; p hsh1

hsh1[:first][2][0] = 4
print "hsh1  (after): "; p hsh1; puts

# ------------------------------------------------------

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
print "hsh2 (before): "; p hsh2

hsh2[['a']][:a][2] = 4
print "hsh2  (after): "; p hsh2; puts
