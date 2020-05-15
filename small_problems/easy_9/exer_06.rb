=begin

Input: String
Output: Array of strings

Explicit Req's
Array will contain every word, then a space, then the length of the word
Words separated by exactly one space

Implicit Reqs
include non-alpha chars in length
emptry string return empty array

break the string up into an array of words
iterate over the array
  - on each word, append a space and the length of the string
return the modified array

=end

def word_lengths(string)
  words_array = string.split(" ")
  words_array.map! do |word|
    word + " " + word.length.to_s
  end
end

puts word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

puts word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

puts word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

puts word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

puts word_lengths("") == []
