=begin

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

Understand the Problem
--------------
Input: string
Output: Array of strings

Explicit Req's:
Palindrome words are case sensitive - "Mom" is not a palindrone

Implicit Req's:
Empty string should return an empty array

Questions to Ask:
Punctuation? Ignore or consider punctuation in substrings?
Return a new array object?
Validate for non string input?
Maintain case in output strings in the array?
What if input string contains multiple words? Treat the words separately?

Algorithm
----------
Need to iterate through each possible substring and determine if that substring is a palindrome
1. Iterate through all possible substrings
  Starting with the first character in the string, slice the string with a length of the string
  Then, still with the first character, slice again with a length that is one shorter
  Then move on to the next character in the substr, and slice with length of str -1
  Then, with the same char, slice again with one less and repeat until the slice length is 1
  Move through rest of the word this way

2. determine if substring is a palindrome
  does the substring equal the reverse of the substring?
    if so, add to array of palindromic substrings
  if not, not a palindrome

=end