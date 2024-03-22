system 'clear'
# rb119 interview assessment - practice problem 11
=begin
'xxyyxxyyxxyy'

tmp = ''

char = 'x'

tmp << char

break if str.split(tmp).empty?

repeat

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]

=end

def repeated_substring(str)
  shortest_subsrt = ''

  str.each_char do |char|
    shortest_subsrt << char
    break if str.split(shortest_subsrt).empty?
  end
  occurrences = str.scan(shortest_subsrt).size
  [shortest_subsrt, occurrences]
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]


=begin

** NOTES **

splitting a string by its repeating substring leaves an empty array

-- 'abcabcabc'.split('abc') => []

because there is nothing left to add to the array after the split, whereas

-- 'abcabcabc'.split('a') => ['', 'bc', 'bc', 'bc']

has elements in its array because it didn't split evenly

this is how we know we've found the shortest repeating substring (empty array)


scanning a string will produce an array with each occurrence of the scan

-- 'abcabcabc'.scan('abc') => ['abc', 'abc', 'abc']

this is how we know the number of times the substring appears within the string

however

-- 'abcabcabc'.scan('a') => ['a', 'a', 'a']

so we must be sure we have the correct substring to scan for

and then we count the number of elements in the array
=end
