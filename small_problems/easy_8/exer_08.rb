CONSONANTS = %w(b c d f g h j k l m n p q r s t  v w x y z)

def double_consonants(string)
  double_chars = ''

  string.each_char do |char|
    if CONSONANTS.include?(char.downcase)
      double_chars << char << char
    else
      double_chars << char
    end
  end

  double_chars
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""