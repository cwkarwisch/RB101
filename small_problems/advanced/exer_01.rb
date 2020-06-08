=begin

Input: text file
Output: display to the console

Reqs
Plugs in a random selection of nouns, verbs, adjectives and adverbs

Noun: potato
Adjective: grungy
Adverb: badly
Verb: protrude

Input: txt file with notations for where each type of word needs to be interpolated
  - e.g. {noun}, {adjective}, etc.
    - for refactoring, {plural_noun}, {plural_verb}, etc...


Program:
  - pre-populated arrays with words of each type
    - for refactoring, have an array of plural nounds, verbs conjugated for singluar and separately
      for plural
  - read in contents of the txt file and covert to a string
  - iterate through the string and replace each token with a word of the appropriate type
    - split up the string into an array of words
    - iterate through the array, replacing any tokens when encountered
  - join the array back into a string

  - display the joined string

=end

NOUNS = ["potato", "curd", "butter-bean", "doggo", "chair", "lamp shade"]

VERBS = ["protrude", "cover", "cook", "yell", "bumble"]

ADJ = ["grungy", "tiiiiiight", "fly", "colorful", "bee-like"]

ADV = ["badly", "shamefully", "shamelessly", "truthfully", "fairly"]

def read_text_file_to_string(file)
  File.read(file).gsub("\n", " ")
end

def replace_token(token)
  token = token.sub("{NOUN}", NOUNS.sample)
  token = token.sub("{VERB}", VERBS.sample)
  token = token.sub("{ADJ}", ADJ.sample)
  token = token.sub("{ADV}", ADV.sample)
  token
end


text = read_text_file_to_string("madlib.txt")
words = text.split(" ")
words.map! do |word|
  replace_token(word)
end
text = words.join(" ")
p text


