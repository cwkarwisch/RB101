def move(n, from_array, to_array)
  while n > 0
    to_array << from_array.shift
    n -= 1
    break if from_array.length == 0
  end
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(7, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']