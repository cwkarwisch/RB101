# load our configuration file containing the program's messages
require 'psych'
MESSAGES = Psych.load_file('calc_config.yml')
LANGUAGE = :en

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

def prompt(message)
  puts MESSAGES[LANGUAGE][message]
  MESSAGES[LANGUAGE][message]
end

prompt(:welcome)

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(:name_error)
  else
    break
  end
end

# main loop
loop do
  def valid_number?(num)
    if num.to_i != 0
      true
    elsif num.start_with?("0")
      true
    else
      false
    end
  end

  def number?(num)
    if num.to_i != 0 && num.to_f != 0.0
      true
    elsif num.start_with?("0")
      true
    else
      false
    end
  end

  number1 = nil

  loop do
    prompt(:first_number)
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt(:number_error)
    end
  end

  number2 = nil

  loop do
    prompt(:second_number)
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt(:number_error)
    end
  end

  prompt(:operator_prompt)
  operator = nil
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(:operator_selection_error)
    end
  end

  result = case operator
           when '1'
             prompt(:operation_status_1)
             number1.to_i + number2.to_i
           when '2'
             prompt(:operation_status_2)
             number1.to_i - number2.to_i
           when '3'
             prompt(:operation_status_3)
             number1.to_i * number2.to_i
           when '4'
             prompt(:operation_status_4)
             number1.to_f / number2.to_f
           end

  puts prompt(:result) + result.to_s

  prompt(:another?)
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(:thanks)
