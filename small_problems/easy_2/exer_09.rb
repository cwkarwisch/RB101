=begin

Take a look at the following code:

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name
What does this code print out? Think about it for a moment before continuing.

If you said that code printed

Alice
Bob
you are 100% correct, and the answer should come as no surprise. Now, let's 
look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
What does this print out? Can you explain these results?

=> BOB, BOB

Unlike the previous example, name is re-assigned to an entirely new string.
By re-assigning name to an entirely new string in the first example, the 
variable name is now pointing at an entirely new string object which had the
value of 'Alice'. Because name was now pointing to an entirely different 
string object, the value of save_name stayed the same, because save_name
was still pointed at the value 'Bob'.

In the second example, in contrast, no re-assignment occurs and the value 
being pointed to by the variable name is itself modified. Since the value
itself is modified by the destructive method String#upcase!, the value pointed
to by save_name is the modified value.

=end