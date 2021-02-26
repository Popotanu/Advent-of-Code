# frozen_string_literal: true

# find out the pair of numbers that sum to 2020
# and then multiply those two numbers together.
#
# O(NlogN)なはず...

OBJECTIVE = 2020
numbers = []
File.foreach('./input.txt') do |line|
  numbers << line.delete("\n").strip.to_i
end

numbers.sort!
res1, res2 = nil, nil

while numbers.length.positive?
  res1 = numbers.shift
  # as "numbers" has been sorted, "res1" is smaller than any other values in the array.
  break if res1 > OBJECTIVE / 2
  # using find-any mode
  if res2 = numbers.bsearch{ |x| OBJECTIVE - (x + res1) }
    break
  end
end

if !res2
  puts 'there arent any pair of numbers ><'
  exit
end

puts 'found out!'
puts "the answer is (#{res1}, #{res2})"
puts "and the result of multiply #{res1} and #{res2} is #{res1 * res2}"
