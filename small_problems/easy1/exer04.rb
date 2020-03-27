=begin

Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element 
alongside the number of occurrences.

Expected output:

car => 4
truck => 3
SUV => 1
motorcycle => 2

Understand the Problem
-----------------------
case-sensitive
Takes one input arrays

Examples/Test Cases
----------------------
What if we recieve an empty array?
What if the input is of a non-array type?
What if the array contains sub-arrays?
What if the array contains data types other than strings?


Data Structures
---------------------
Input: array
Output: print out each element and its count
  - create this output from a hash
  - we will populate the hash as we iterate through the array
  - the keys will be the elements, and the associated value will be the count


Algortihm
----------------------
- create an empty hash
- iterate through each element of the array
  - when we encounter an element, check if that element is a key in the hash
    - if not, add the element as a key in the hash (as a string) and set the value to 1
    - if it is already a key in the hash, increment the associated value by 1

=end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'suv', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  occurrences = {}
  array.each do |elem|
    if occurrences.has_key?(elem)
      occurrences[elem] += 1
    else
      occurrences[elem] = 1
    end 
  end

  occurrences.each {|key, value| puts "#{key} => #{value}"}
  occurrences
end


count_occurrences(vehicles)

puts "--------------------------"

# Further Exploration

# with case insensitive comparisons 

def count_occurrences2(array)
  occurrences = {}
  array.each do |elem|
    if occurrences.has_key?(elem.downcase)
      occurrences[elem.downcase] += 1
    else
      occurrences[elem.downcase] = 1
    end 
  end

  occurrences.each {|key, value| puts "#{key} => #{value}"}
  occurrences
end


count_occurrences2(vehicles)