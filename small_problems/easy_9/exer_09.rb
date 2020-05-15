=begin

Input: three integers
Output: String

Explicit Reqs
All inouts will be between 0 and 100
Determine mean
Return letter grade associated with that value

Implicit Reqs
How to handle rounding?
OK with integer division?

Algorithm

Calculate sum of three test scores
Divide by 3.0 to calcualte the mean

Look up the associated value for the mean
Return the letter grade

=end

GRADE_TABLE = {
  'A' => (90..100),
  'B' => (80...90),
  'C' => (70...80),
  'D' => (60...70),
  'F' => (0...60)
}

def get_grade(score1, score2, score3)
  sum = score1 + score2 + score3
  mean = sum / 3.0
  grade_hash = GRADE_TABLE.select {|_, value| value.include?(mean) }
  grade_hash.keys[0]
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"