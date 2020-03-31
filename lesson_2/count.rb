require "pry"

counter = 0

loop do
  counter += 1
  binding.pry if counter == 3
  break if counter == 5
end 