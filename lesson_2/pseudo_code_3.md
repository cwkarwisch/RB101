CASUAL PSEUDO-CODE

take as a single argument an array of integers
create a new empty array
iterate through the original array and place every other element into the new array
return the new array

need to know whether to start with the first element or the second
could create a second parameter with a default choice if not specified when method invoked

FORMAL PSEUDO-CODE

START

GET an array of integers
CHECK input is an array
SET every_other_array to an empty array
ITERATE through the original array
  - IF we want to start with the first element, PUSH the element to the new array if the
    element's index is even
  - ELSE, if the index is odd, go to the next iteration
RETURN the every_other_array

END


