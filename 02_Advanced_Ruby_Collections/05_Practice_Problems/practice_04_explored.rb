# practice_04_explored.rb
system "clear"
###############################################################################

# where the value 3 occurs, demonstrate how you would change this to 4


# arr1 = [1, [2, 3], 4]

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

# hsh1 = {first: [1, 2, [3]]}

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# --------------------------------------------------------------------------- #

# return a new object:
arr1 = [1, [2, 3], 4]
nd_arr1 = arr1.map do |element|
            if element.to_s.to_i == element
              element
            else
              element.map { |e| e == 3 ? e += 1 : e }
            end
          end

puts "non-destructive:"
print "arr1:    "
p arr1
print "nd_arr1: "
p nd_arr1

# mutate the original:
arr1[1][1] += 1

puts "\ndestructive:"
print "arr1: "
p arr1

# --------------------------------------------------------------------------- #
gets
system "clear"
# --------------------------------------------------------------------------- #

# return a new object:
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
nd_arr2 = arr2.map do |element|
            element == 3 ? element += 1 : element
          end

puts "non-destructive:"
print "arr2:    "
p arr2
print "nd_arr2: "
p nd_arr2

# mutate the original:
arr2[2] += 1

puts "\ndestructive:"
print "arr2: "
p arr2

# --------------------------------------------------------------------------- #
gets
system "clear"
# --------------------------------------------------------------------------- #

# return a new object:
hsh1 = {first: [1, 2, [3]]}
nd_hsh1 = hsh1.map do |key, value|
            v = value.map do |element|
                  if element.to_s.to_i == element
                    element
                  else
                    element.map { |e| e += 1 }
                  end
                end
            [key, v]
          end

# converting nd_hsh1 from a nested array back into a hash
nd_hsh1 = nd_hsh1.to_h

puts "non-destructive:"
print "hsh1:    "
p hsh1
print "nd_hsh1: "
p nd_hsh1

# mutate the original:
hsh1[:first][2][0] += 1

puts "\ndestructive:"
print "hsh1: "
p hsh1

# --------------------------------------------------------------------------- #
gets
system "clear"
# --------------------------------------------------------------------------- #

# return a new object:
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
nd_hsh2 = hsh2.map do |key, value|
            if key == 'b'
              [key, value]
            else
              v = value.map do |sub_key, sub_value|
                    if sub_key == :b
                      [sub_key, sub_value]
                    else
                      sub_v = sub_value.map { |e| e == 3 ? e += 1 : e }
                      [sub_key, sub_v]
                    end
                  end
              [key, v]
            end
          end

# converting inner array back into a hash
nd_hsh2[0][1] = nd_hsh2[0][1].to_h

# converting outer array back into a hash
nd_hsh2 = nd_hsh2.to_h

puts "non-destructive:"
print "hsh2:    "
p hsh2
print "nd_hsh2: "
p nd_hsh2

# mutate the original:
hsh2[['a']][:a][2] += 1

puts "\ndestructive:"
print "hsh2: "
p hsh2

# --------------------------------------------------------------------------- #

###############################################################################
puts puts
