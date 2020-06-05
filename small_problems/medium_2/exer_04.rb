=begin

Input: string
Output: boolean

Explicit Reqs
Return true if parantheses are properly balanced
Matching pairs must begin with ( and not with )

Implicit Reqs
Non-string input?
String with no parantheses?
Empty string?

Algorithm

Walk through every character in the string, each time you find an opening parens, make sure you find a matching closing parens later
If you find a closing parens at any point and haven't found a corresponding opening parens, the string is not balanced

Pseudocode

# Remove all characters from the string that are not parantheses

# Count the number of opening parens
# Count the number of closings
# Compare the count of opening parens to closing parens
#   - If different, return false

# If equal, check each closing parens is preceded by a corresponding opening parens

Initialize a counter for opening parens marks
Initialize a counter for closing parens marks

Iterate through each character in the string,
  - whenever an open parens is encountered,
    - increment count of open parens
  - when a closing parens is encountered
    - increment count of closing parens
    - if closing parens count is greater than opening parens count
      - return false

return true

=end

def balanced?(string)
  open_count = 0
  close_count = 0
  string.chars.each do |char|
    open_count += 1 if char == '('
    close_count +=1 if char == ')'
    return false if close_count > open_count
  end
  return false if open_count != close_count
  return true
end


puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
