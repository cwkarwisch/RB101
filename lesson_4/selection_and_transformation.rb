def select_fruit(hash)
  pairs = {}
  keys = hash.keys
  counter = 0

  loop do
    if hash[keys[counter]] == "Fruit"
      pairs[keys[counter]] = "Fruit"
    end

    counter += 1
    break if counter == keys.size
  end
  pairs
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}


def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= 2
    counter += 1
  end
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]
my_numbers

def double_odd_indexed_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_value = numbers[counter]
    current_value *= 2 if counter.odd?
    doubled_numbers << current_value

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_odd_indexed_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

my_numbers                      # => [1, 4, 3, 7, 2, 6]


def multiply(numbers, factor)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size
    multiplied_numbers << (numbers[counter] * factor)
    counter += 1
  end

  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
my_numbers



