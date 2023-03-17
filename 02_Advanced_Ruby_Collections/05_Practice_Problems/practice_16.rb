# practice_16.rb
system "clear"
# --------------------------------------------------------------------------- #
#
# Question: a method to generate one UUID
#
# 32 hexadecimal characters
# in 5 sections: 8-4-4-4-12
# represented as a string: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
#
# --------------------------------------------------------------------------- #

# my solution:

def generate_UUID
  characters = %w(a b c d e f)
  (0..9).each { |n| characters << n.to_s }

  sections = [ 8, 4, 4, 4, 12 ]
  uuid = ''

  sections.each do |chars_remaining|
    chars_remaining.times do
      uuid << characters.sample
    end
    uuid << '-' unless uuid.size == 36    # no trailing dash
  end
  uuid
end

puts generate_UUID
