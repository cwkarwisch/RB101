=begin

Input: string
Output: boolean

Explicit Reqs:
Spelling blocks have one letter on each side
Cannot spell any word that uses a letter on both sides of a given block
Cannot use any given letter more than once

Implicit Reqs
Can't spell any word with punctuation
Ignore case
Emptry string true?
Validate for string input?

Algorithm
-Iterate through every letter in the word
  - At each letter, check whether the letter is still available and hasn't been used yet
    - If the letter is still available,
        - remove applicable block from what is available
        - proceed to next letter
    - If letter is unavailable (either because it's been used before or the other side has been used)
      - return false
- return true

=end

def block_word2?(word)

  available = {
    'A' => ['N', 'A'],
    'B' => ['B', 'O'],
    'C' => ['C', 'P'],
    'D' => ['D', 'Q'],
    'E' => ['R', 'E'],
    'F' => ['F', 'S'],
    'G' => ['G', 'T'],
    'H' => ['H', 'U'],
    'I' => ['V', 'I'],
    'J' => ['J', 'W'],
    'K' => ['X', 'K'],
    'L' => ['L', 'Y'],
    'M' => ['Z', 'M'],
    'N' => ['N', 'A'],
    'O' => ['B', 'O'],
    'P' => ['C', 'P'],
    'Q' => ['D', 'Q'],
    'R' => ['R', 'E'],
    'S' => ['F', 'S'],
    'T' => ['G', 'T'],
    'U' => ['H', 'U'],
    'V' => ['V', 'I'],
    'W' => ['J', 'W'],
    'X' => ['X', 'K'],
    'Y' => ['L', 'Y'],
    'Z' => ['Z', 'M'],
  }

  letters = word.upcase.split('')
  letters.each do |letter|
    if available[letter]
      available.delete_if do |key, value|
        value.include?(letter)
      end
    else
      return false
    end
  end
  return true
end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze


puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true

puts block_word?('LYE') == false
puts block_word?('zoom') == false
puts block_word?("hiiii") == false