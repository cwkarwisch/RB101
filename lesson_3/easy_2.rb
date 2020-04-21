# QUESTION 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.has_key?('Spot')
puts ages.key?('Spot')
puts ages.include?('Spot')

# QUESTION 2

munsters_description = "The Munsters are creepy in a good way."

p munsters_description.swapcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase

# QUESTION 3

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
p ages

# QUESTION 4

advice = "Few things in life are as important as house training your pet dinosaur."
# depends on what we mean by name "Dino". If we care about case and whether it's a standalone word...

puts advice.split(" ").include?("Dino")

# if we just want to know if the series of characters appear...

puts advice.include?("Dino")

# QUESTION 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# QUESTION 6
flintstones.push("Dino")
p flintstones

# QUESTION 7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino" << "Hoppy"
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino", "Hoppy")
p flintstones

# QUESTION 8
advice = "Few things in life are as important as house training your pet dinosaur."
sliced_advice = advice.slice(0, 39)
advice = advice.slice(39, advice.length - 1)
p sliced_advice
p advice

advice = "Few things in life are as important as house training your pet dinosaur."
sliced_advice = advice.slice!("Few things in life are as important as ")
p advice
p sliced_advice

#QUESTION 9
statement = "The Flintstones Rock!"
count = statement.count("t")
puts count

#QUESTION 10
title = "Flintstone Family Members"
centered_title = title.rjust(((40 - title.length) / 2) + title.length, " ")
p centered_title

centered_title = title.center(40, " ")
p centered_title
