[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end

# 1
# 3

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end

# 1
# 3
# [nil, nil]

# On line 1, Array#map is being called on the outer array. As Array#map iterates through
# element of the outer array, each element is passed into the block and bound to the
# local variable arr. Within the block, Array#first is called on each sub-array, and the
# method returns the element at index 0 of the array, in this case 1 and 3. That return value
# is then passed to puts, which outpts a string representation of those numbers. Puts returns nil, and
# since puts is the last evaluated expression in the block, the block returns put.
# Map uses the return value of the block and places that return value in a new array that will have
# the same number of elements as the array that called map, which in this case will be two elements.
# Since nil is returned by the block on each iteration, map returns a new array with two elements, each
# of which is nil. [nil, nil] Map does not destrucitvely modify the outer array on which it was called.


[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# 1
# 3
# => [1, 3]


# Here, Array#map is being called on the outer array. As Array#map iterates through
# each element of the outer element, each element is passed into the block
# and bound to the local variable arr. In the first iteration of map, the sub-array [1, 2]
# is passed into the block.
#
# On the first line within the block, Array#first is called on the sub-array [1, 2]. Array#first
# returns the element at index 0 of the array on which the method was called, which in this case
# is the integer 1. That retrn value, 1, is pased to the puts method, which outputs a string
# representation of the integer. Puts then returns nil, but nothing is done with the return value.
#
# On the next line within the block, Array#first is called again, once again returning the element at
# index 0 of the calling array, which is still 1. The return value of arr.first is used since it is the
# last evaluated expression of the block, and the return value of the last evaluated expression is passed to map,
# which uses it for transformation by placing it in a new array that will have the same number of elements as
# the outer array on which map was called.

# The process is repeated when map iterates through the second element of the outer array. After the second iteration,
# map returns a new array with two elements, in this case [1, 3]. Map does not mutate the caller. The return value of
# map id displayed here, but nothing else is done with the return value in this code.

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

# 18
# 7
# 12
# => [[18, 7], [3, 12]]

# Here, Array#each is being called on the outer array [[18, 7], [3, 12]].
# Array#each iterates over both of the elements in th outer array, each of which happens to
# be an array. On each iteration of Array#each, an element of the outer array is passed
# into the block and bound to the local variable arr.

# Within the block, Array#each is called on the sub-array that has been passed into the block. This call to
# Array#each will iterate over each element in the sub-array, which in these cases here are integers. On each
# iteration, a number from the subarray is passed into the block and bound to the local variable
# num.

# Within that block, a conditional is evaluated to determine whether num is greater than 5. Where the integer passed
# in is greater than 5, the code within the conditional will execute.

# Within the conditional, the number bound to the local variable num is passed to the method puts, which displays
# the number. Puts returns nil, which in the case of a number being passed in that is greater than 5, will be the
# last expression evaluated in this block, which will cause the return value of the block to be nil. In the case
# where the number passed into this block is 5 or less, the last evaluated expression in the block is the conditional.
# When the conditional is not met, the return value of the block is nil. Although the return value of this block will be
# nil in any event, Array#each does not use this return value, since Array#each returns the object on which it was called.
# At this layer of the code, Array#each will return [18, 7] and [3, 12] on its two iterations.

# Within the upper block, however, nothing is done with the return value from the block, since Array#each returns the object
# on which it was called. Accordingly, my_arr ends up with a value of [[18, 7], [3, 12]].

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# => [[2, 4], [6, 8]]

# Array#map: called on the outer array. Side effects: none. Return value: [2, 4], [6, 8]] Return value used? No.

# outer block: passed to Array#map. Called on each element of the outer array, which in this case are sub-arrays.
# Side effects? No. Return value? the new arrays that are returned by the call to map within the outer block,
# which are a transformation of the original sub-arrays. Return value used? Yes, passed to map and used to populate
# the new array returbed by map.

# Array#map (within the outer block). Called on each subarray. Side effects? None. Return value? New array
# that is the transformation of the subarray after running the inner block. Return value used? Yes -
# used as the return value of the outer block, which is passed back to map.

# inner block. Called on each integer in the subarrays. Side effects? None. Return value? the product of the
# number passed into the block times 2. Return value used? Yes - passed back to map.

# * operator. Called on each integer in the subarray to multiply the integer by 2. Side effect? No.
# Return value? the product of the integer and 2. Return value used? Yes - used as the return value
# of the inner block.

# Example 6

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

#Array#select
# - Called by: the array
# - Side Effects? None
# - Return value: a new array containing the selected elements from the calling array (the ones that result
#                 in true being returned by the outer block)
# - Return value used? No.

# Here, Array#select is called on this array of hashes. Array#select returns a new array that contains
# the elements in self that evaluate to truthy value when passed to the given block. Select will iterate
# over each element in the calling array, passing the two hashes into the outer block and deciding
# whether to include those hashes in the new array based on whether the outer block returns a truthy or falsy
# value to select. Here, the first hashed passed to the outer block will ultimately result in the
# outer block returning false to select, and accordingly the first hash will not be included in the new array
# returned by select. The second hash passed into the outer block will ultimately result in the outer block
# returning true to select, and accordingly thr second hash will be added to the new array that will be
# returned by select.

# Outer Block
# Called by: the select method
# Side Effects: None
# Return Value: boolean
# Return Value used? Yes - passed back to select to determine what elements of the array Array#select
#                    will return.

# Each element of the array will be passed into the outer block and assigned to the local variable hash.
# After running the code within the block, the outer block will return a boolean to select, whichn select will
# use to determine which elements to add to the new array that will be returned by select.

# Enumerable#all?
# Called by: each hash passed into the outer block and assigned to the local variable "hash"
# Side effects? None.
# Return Value: boolean
# Return value used? Yes - Determines the return value of the block

# Enumerable#all? passes each key value pair from the hash into the inner block. All? will return a boolean
# depending on whether every key value pair passed into the inner block ultimately causes the inner block
# to return a truthy value on every iteration.

# Inner Block
# Called by: Enumerable#all?
# Side Effects: None
# Return Value: the result of evaluating the last statement in the block, which in this case will be a boolean
# Return Value used? Yes - passed back to Enumerable#all? to determine that method's return value

# Each key value pair is passed into the inner block and bound to the local variables key and value, respectively.
# The code within the block is then executed, and the inner block will pass the resulting boolean back to all?

# == Comparison Operator
# Called on: value[0] - the first character in each value in the hash, which in this case are all strings
# Side effects? None
# Return Value: Yes - returns a boolean based on whether the first character in the value is
#               equal to the corresponding key, once the key has been converted from a symbol
#               to a string.
# Return Value Used? Yes - used to determine the return value of the inner block.

# The comparison operator returns a boolean, which determines the return value of Enumerable#all?


# EXAMPLE 10

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# [[[2, 3] [4, 5]], [6, 7]]

#Array#map
# Called on: the outer array
# Side Effects: None.
# Return value: a new two element array that contains the transformed values caused by exercising code within the block
# Return value used? No.

# outer block
# Called on: each element in the outer array
# Side Effects: None
# Return value: a transformed array on each iteration
# Return value used? Yes - used by map

# inner Array#map
# Called on: each subarray (each element in the outer array)
# Side Effects: None
# Return Value:  a transformed subarray
# Return value used? Yes - used to determine return value of the outer block


# middle tier block
# Called on: Each element in the subarray
# Side Effects: None.
# Return value: Transformed elements
# Return value used? Yes, passed to map to be placed into transformed subarrays

# if conditional
# called on: element of the sub-array in that iteration
# Side Effects: None.
# Return Value: nil
# Return Value Used? No

# #to_s
# Called on: element of the sub-array in that iteration
# Side Effects: None.
# Return Value: a string representation of the element in the subarray.
# Return value used? Yes - used by String#size.

# String#size
# Called on: The string representation of the element in the subarray
# Side Effects: None.
# Return Value: An integer representing the length of the string.
# Return value used? Yes - used by the comparison operator.

# == 1 comparison operator
# Called on: The size of the string representation of the element in the subarray
# Side Effects: None.
# Return Value: boolean
# Return Value Used? Yes - used by if conditional

# + 1 addition operator
# called on: element of the sub-array in that iteration if conditional true
# side effects: None.
# Return Value: Integer
# Return Value used? Yes - affects return value of the block

# else conditional
# called on: ??? element of the subarray in that iteration?
# side effects: None.
# Return Value: nil
# Return Value used? No.

# Arry#map
# Called on: element of the subarray in that iteration
# Side Effects: None.
# Return Value: Transformed array
# Return Value Used? Yes - used to determine the return value of the block

# innermost block
# called on: Each element of the subarray in that iteration of the middlie-tier block
# Side Effects: None.
# Return Value: Integer.
# Return Value used? Yes - passed back to map and placed in the transformed array.

# + 1 addition operator
# called on: the number from the subarray in that iteration
# side effects: None.
# return value: Integer.
# return value used? Yes - determines the return value of the block.




