# frozen_string_literal: true
#
# answer:
#   the number of passwords according to the following policy:
#     > the lowest and highest number of times a given letter must appear for the password to be valid.
#     > For example, 1-3 a means that the password must contain a at least 1 time and at most 3 times.

valid_passes = 0
File.foreach('./input.txt') do |row|
  min,max,char,pw = row.split(/-|\s/)
  char.delete!(':')
  if (min.to_i..max.to_i).include?(pw.count(char))
    valid_passes += 1
  end
end

puts "#{valid_passes} passwords are valid."
