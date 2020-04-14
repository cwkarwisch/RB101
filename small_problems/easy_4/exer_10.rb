STRING_TO_INT = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
}

def integer_to_string(number)
  string = ''

  digit = number % 10
  string.insert(0, STRING_TO_INT[digit])

  until number / 10 == 0
    number = number / 10
    digit = number % 10
    string.insert(0, STRING_TO_INT[digit])
  end

  string
end 

def signed_integer_to_string(number)
  if number > 0
    return integer_to_string(number).prepend('+')
  elsif number < 0
    return integer_to_string(number * -1).prepend('-')
  else
    return integer_to_string(number)
  end
end 


puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'