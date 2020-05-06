def substrings_at_start(string)
  array = []
  sub_string = ""
  index = 0
  until index == string.length
    sub_string += string[index]
    array << sub_string
    index += 1
  end
  array
end

def substrings(string)
  array = []
  length = string.length
  starting_index = 0
  loop do
    array += substrings_at_start(string.slice(starting_index, length))
    starting_index += 1
    break if starting_index == length
  end
  array
end

def palindromes(string)
  array = substrings(string)
  array.select! { |sub_string| sub_string.length > 1}
  array.select! { |sub_string| sub_string == sub_string.reverse }
  array
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]