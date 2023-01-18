system "clear"
# Practice Problem 8:
# key takeaway -> Iterators operate on the original array in real time.

q_1 = <<-code_1
>> What would be output by this code?

>> numbers = [1, 2, 3, 4]
>> numbers.each do |number|
>>   p number
>>   numbers.shift(1)
>> end
code_1

q_2 = <<-code_2
>> What would be output by this code?

>> numbers = [1, 2, 3, 4]
>> numbers.each do |number|
>>   p number
>>   numbers.pop(1)
>> end
code_2

# --------------------------------------------------------------------------- #
puts q_1

puts "\nmy answer:"

puts "1\n3\n\n"

puts "output from code:"
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

puts "-" * 80
puts

# --------------------------------------------------------------------------- #
puts q_2

puts "\nmy answer:"

puts "1\n2\n\n"

puts "output from code:"
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end


puts puts

# --------------------------------------------------------------------------- #
