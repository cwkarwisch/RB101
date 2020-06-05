=begin

Input: 3 numbers
Output: symbol

Explicit Reqs
Equilateral: all sides equal
Isosceles: 2 sides equal, third different
scalene: all 3 sides different

Invalid unless a) all sides > 0 and b) two shorter sides combined longer than longest side

Implicit
Accept integers and floats
Validate numeric input?


Algorithm

Check that triangle is valid
  - Confirm all three sides are greater than 0
    - if not all > 0, return false
  - determine which side is longest
    - if sum of two other sides is short than longest side
      - return false
  - Otherwise, return true

If invalid, return symbol for invalid

If valid, check for type of triangle

  - If all sides are equal
    - return symbol equilateral
  - if two sides are equal and third is different
    - return isosceles
  - if all three sides different
    - return symbol for scalene

=end

def triangle(side1, side2, side3)
  return :invalid unless valid_triangle?(side1, side2, side3)
  return :equilateral if side1 == side2 && side1 == side3
  return :isosceles if isosceles?(side1, side2, side3)
  return :scalene if scalene?(side1, side2, side3)
end

def isosceles?(side1, side2, side3)
  array = [side1, side2, side3]
  return true if array.count(side1) == 2
  return true if array.count(side2) == 2
  return false
end

def scalene?(side1, side2, side3)
  return true if side1 != side2 && side1 != side3 && side2 != side3
  return false
end

def valid_triangle?(side1, side2, side3)
  return false if side1 <= 0 || side2 <= 0 || side3 <= 0
  longest_side_length = side1
  longest_side_index = 0
  array = [side1, side2, side3]
  array.each_with_index do |side, index|
    if side > longest_side_length
      longest_side_length = side
      longest_side_index = index
    end
  end
  array.delete_at(longest_side_index)
  return false if longest_side_length >= array.sum
  return true
end

# puts valid_triangle?(3, 3, 3) == true
# puts valid_triangle?(3, 3, 1.5) == true
# puts valid_triangle?(3, 4, 5) == true
# puts valid_triangle?(0, 3, 3) == false
# puts valid_triangle?(3, 1, 1) == false

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
