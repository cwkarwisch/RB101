=begin

Input: odd integer
Output: display of diamonds

Explicit Reqs
4 sided diamond with edges n long
n always odd integer

Algorithm
pad line with n/2  spaces
print 1 asterisk

pad line with n/3 spaces
print 3 asterisks

pad line with n/4
print 5 asterisks

pad line with n/5 spaces
print 7 asterisks

no padding
print 9 asterisks

=end

def diamond(number)
  puts ""
  top_half(number)
  puts "*" * number
  bottom_half(number)
  puts ""
end

def top_half(number)
  padding = number / 2
  asterisks = 1
  loop do
    break if asterisks == number
    puts (" " * padding) + ("*" * asterisks)
    padding -= 1
    asterisks += 2
  end
end

def bottom_half(number)
  padding = 1
  asterisks = number - 2
  loop do
    break if asterisks < 1
    puts (" " * padding) + ("*" * asterisks)
    padding += 1
    asterisks -= 2
  end
end

diamond(9)

diamond(3)

diamond(1)

diamond(31)