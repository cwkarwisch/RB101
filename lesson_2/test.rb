array = [1, 2, 3]

p(array.map do |num|
  num + 1                           #  <Enumerator: [1, 2, 3]:map>
end)  