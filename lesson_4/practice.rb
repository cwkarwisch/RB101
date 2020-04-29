flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = {}
flintstones.each_with_index{ |name, idx| hash[name] = idx }
hash


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum = ages.values.inject(:+)
sum



ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if { |name, age| age >= 100 }
ages

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.min

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.find_index { |name| name.start_with?("Be") }

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map!{|name| name.slice(0, 3)}
flintstones

hash = Hash.new(0)
statement = "The Flintstones Rock"
statement.split(' ').join('').chars.each{ |char| hash[char] += 1 }
hash

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# 1
# 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1
# 2

words = "the flintstones rock"

def titleize(title)
  title.split(" ").map { |word| word.capitalize }.join(" ")
end

title = titleize(words)
title

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |_, value|
  if value["age"] < 18
    value["age_group"] = "kid"
  elsif value["age"] < 65
    value["age_group"] = "adult"
  elsif value["age"] >= 65
    value["age_group"] = "senior"
  end
end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |_, value|
  case value["age"]
  when 0..17 then value["age_group"] = "kid"
  when 18..64 then value["age_group"] = "adult"
  when 65.. then value["age_group"] = "senior"
  end
end

p munsters