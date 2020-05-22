=begin

Input: String
Output: string

Explicit Reqs
Return the same string not a new object
Convert one, two three, etc to digit strings

Implicit reqs
Maintain spaces between digits
Empty string return empty string?
If no numbers return same sentence
Need to deal with capitalization - assume don't limit to lc conversion
OK to convert other numbers or limit ourselves to 0-9?

Algorithm
Go through each word in the sentence
  - Check whether the word is zero - nine
  - If so, convert the word to its digit form
Return the sentence

=end

WORD_DIGITS = {
  "zero" => "0",
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9"
}

def word_to_digit2(sentence)
  words = sentence.split(" ")
  words.map! do |word|
    if WORD_DIGITS.keys.include?(word.downcase)
      WORD_DIGITS[word]
    else
      word
    end
  end
  sentence.replace(words.join(" "))
end

def word_to_digit(sentence)
  WORD_DIGITS.each_key do |word|
    sentence.gsub!(/\b#{word}\b/i, WORD_DIGITS[word])
  end
  sentence
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts word_to_digit('Please call me at five five five one two three four. Thanks.')
puts word_to_digit('Freight')
puts word_to_digit('EIGHT')
puts word_to_digit('EighT')
