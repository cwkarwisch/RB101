=begin

Input: string
Output: display if print is supplied as an argument; otherwise, nothing

Explicit Reqs


Implicit Reqs
Multiple commands can be given at once within the same string
and we should execute them in order

In between calls to minilang, it doesn't appear that the stack and register values persist
Handle negative number inouts for n

DS

Implement with array and push, pop?

=end

def minilang(string)
  stack = []
  register = 0

  commands = string.split(" ")
  commands.each do |command|
    if command.to_i.to_s == command
      register = command.to_i
    elsif command == "PUSH"
      stack.push(register)
    elsif command ==  "ADD"
      value = stack.pop
      register += value
    elsif command ==  "PRINT"
      puts(register)
    elsif command ==  "SUB"
      value = stack.pop
      register -= value
    elsif command ==  "MULT"
      value = stack.pop
      register *= value
    elsif command ==  "DIV"
      value = stack.pop
      register /= value
    elsif command ==  "MOD"
      value = stack.pop
      register %= value
    elsif command ==  "POP"
      register = stack.pop
    end
  end
end

minilang('PRINT')
# 0

puts "-------------"

minilang('5 PUSH 3 MULT PRINT')
# 15

puts "-------------"

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

puts "-------------"

minilang('5 PUSH POP PRINT')
# 5

puts "-------------"

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

puts "-------------"

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

puts "-------------"

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

puts "-------------"

minilang('-3 PUSH 5 SUB PRINT')
# 8

puts "-------------"

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

puts "-------------"
