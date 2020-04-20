# new steps
# iterate through the array of words and replace every non-alphabetic character with a space
# iterate through the array of words and for each each word delete any spaces

def word_sizes(sentence)
  hash = Hash.new(0)
  words = sentence.split(" ")
  words.map! { |word| word.gsub(/[^a-zA-Z]/, ' ')}
  words.map! { |word| word.delete(" ")}
  words.each { |word| hash[word.length] += 1 }
  hash
end

puts "tests"
puts "-------"

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
