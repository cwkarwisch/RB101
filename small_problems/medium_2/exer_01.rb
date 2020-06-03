=begin

Input: Text file
Output: Display the longest sentence in the text file and the number of words in that sentence

Explicit Reqs
Sentences may end in a period, exclamation point, or question mark
Any series of characters that are not sentence ending characters or spaces should be treated as a word

Implicit Reqs
Validate for non-text input?
How to handle empty text file?
Text file that contains text but doesn't contain sentence ending punctuation?
What if there are multiple sentences of the same length and we have a tie for longest?

Algorithm
  - Split up the text into individual sentences whenever we encounter . ! or ?
  - Iterate through each sentence
    - Count the number of words in the sentence
      - On first pass, save this number of words as the longest sentence and note which sentence that length corresponds to
      - On each subsequent pass, compara the number of words with the current longest number of words
        - If a subsequent sentence has more words, update the length of the longest sentence thus far and its location

  - After iteration,
    - display the longest sentence by going back to the location we noted
    - display the number of words

=end

def extract_text_file_into_string(txt_file)
  text = File.read(txt_file)
  text.gsub!("\n", " ")
end

def split_into_array_of_sentences(text)
  text.split(/(?<=[.!?])\s*/)
end

def display_longest_sentence(txt_file)
  text = extract_text_file_into_string(txt_file)
  sentences = split_into_array_of_sentences(text)
  longest_sentence_length = 0
  longest_sentence_index = nil
  sentences.each_with_index do |sentence, index|
    words = sentence.split(" ")
    length = words.size
    if length > longest_sentence_length
      longest_sentence_length = length
      longest_sentence_index = index
    end
  end
  puts ""
  puts sentences[longest_sentence_index]
  puts ""
  puts "The longest sentence has #{longest_sentence_length} words."
  puts ""
end

display_longest_sentence("gettysburg.txt")



