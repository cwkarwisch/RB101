arr = ['10', '11', '9', '7', '8']

sorted = arr.sort { |a, b| b.to_i <=> a.to_i }
sorted

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted = books.sort { |a, b| a[:published].to_i <=> b[:published].to_i }
sorted

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].keys[0]


arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
hsh2

# PROBLEM 5

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0
munsters.each do |_, value|
  if value["gender"] == 'male'
    total_age += value['age']
  end
end

total_age

# PROBLEM 6

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|
  "#{key} is a #{value["age"]}-year-old #{value['gender']}."
end

# PROBLEM 7

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

a # => 2 ## NOT 4, because this is re-assignment
b # => [3, 8] ## This is indexed assignment, but we are using the original value of a which has not changed to modify
#        the first element
arr # => [4, [3, 8]] # Line 87 does modify the first element in the array, but it doesn't change the value
#          pointed to by a because this is re-assignment

# PROBLEM 8

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |array|
  array.each do |element|
    element.chars.each do |char|
      char if char =~ /[aeiou]/
    end
  end
end

# PROBLEM 9

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted = arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end

sorted

# PROBLEM 10

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

incremented = arr.map do |hash|
                array = hash.to_a
                array.each do |pair|
                  pair[1] += 1
                end
                array.to_h
              end

incremented

incremented2 = arr.map do |hash|
  new_hash = {}
  hash.each do |key, value|
    new_hash[key] = value + 1
  end
  new_hash
end

incremented2

# PROBLEM 11

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

pruned_arr = arr.map do |sub_arr|
  sub_arr.select { |elem| elem % 3 == 0 }
end

pruned_arr

# PROBLEM 12

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hash = {}

arr.each do |sub_arr|
  hash[sub_arr[0]] = sub_arr[1]
end

hash

# PROBLEM 13

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

sorted = arr.sort_by do |sub_arr|
  sub_arr.select { |elem| elem.odd? }
end

sorted

# PROBLEM 14

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

array = []

hsh.each do |_, value|
  if value[:type] == 'fruit'
    array << value[:colors].map { |color| color.capitalize}
  end
  array << value[:size].upcase if value[:type] == 'vegetable'
end

array

# PROBLEM 15

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

pruned = arr.select do |hash|
  hash.values.flatten.all? {|num| num.even? }
end

pruned2 = arr.select do |hash|
  hash.all? do |key, value|
    value.all? do |num|
      num.even?
    end
  end
end

pruned

pruned2

HEX_CHARS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def create_UUID()
  HEX_CHARS.sample(8).join + "-" +
    HEX_CHARS.sample(4).join + "-" +
    HEX_CHARS.sample(4).join + "-" +
    HEX_CHARS.sample(4).join + "-" +
    HEX_CHARS.sample(12).join
end

p create_UUID
p create_UUID
p create_UUID






