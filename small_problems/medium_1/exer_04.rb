=begin

Input: number
Output: array

Explicit Reqs
Return an array that shows the position of the lights that are on after n steps
Lights all start off
Begin n steps
  - Step 1: turn on every switch
  - Step 2: Toggle every second switch
  - Step 3: Toggle every third switch
  - Step 4: etc...
  - Continue until number of steps equals n

Implicit Reqs
Always assume at least 1 light?
Validate for positive int input?
0 lights return empty array?
Negative int input?

Data Structures
Array is natural choice because that is what we return and order matters
But with a hash we can easily keep track of whether a switch is on or off
  - With a hash, we can toggle the on/off state, and at the end simply select those
    that are on and place their indices into an array and return that
  - With an array, will need to move numbers in and out of the array

Algorithm
Set a loop that will execute n times
set interval = 1
On each pass through the loop
  - stop the loop when interval equals n
  - toggle the switches at appropriate interval
  - increment interval by 1
Return the switches that are toggled on

Will be helpful to have a toggle helper function

=end

def lights(number)
  on_switches = []
  switches = (1..number).to_a
  interval = 1

  loop do
    break if interval > number
    switches.each do |switch_number|
      toggle_switch!(on_switches, switch_number) if switch_number % interval == 0
    end
    interval += 1
  end

  on_switches.sort
end

def toggle_switch!(array, position)
  if array.include?(position)
    array.delete(position)
  else
    array.push(position)
  end
end

puts lights(5) == [1, 4]
puts lights(10) == [1, 4, 9]