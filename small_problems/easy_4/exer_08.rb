STR_TO_INT_CONV_TABLE= {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9
}

def string_to_integer(str)
  
  counter = str.length
  multiple = 1
  number = 0

  while counter > 0
    num_of_char = STR_TO_INT_CONV_TABLE[str[counter - 1]]
    number += (num_of_char * multiple)
    multiple *= 10
    counter -= 1
  end
  number
end

def string_to_signed_integer(str)
  if str[0] == '+'
    return string_to_integer(str.delete_prefix('+'))
  elsif str[0] == '-'
    return string_to_integer(str.delete_prefix('-')) * -1
  else
    return string_to_integer(str)
  end
end

def string_to_signed_integer2(string)
  case string[0]
  when '+' , '-' then new_string = string[1..-1]
  else                new_string = string
  end
  integer = string_to_integer(new_string)
  integer *= -1 if string[0] == '-'
  integer
end

puts "tests"
puts "----------"

puts string_to_signed_integer2('4321') == 4321
puts string_to_signed_integer2('+100') == 100
puts string_to_signed_integer2('-570') == -570
