Understand the Problem
-------------
We need to obtain three pieces of information from the user about their loan.
From those inputs, we can calculate the user's monthly payment.  

Input: three strings from the user
Output: Display to the user their monthly payment

Examples/Test Cases
-------------
Validate that we have recieved valid numbers in each input.
Handle negative numbers.

Data Structures
-------------
Inputs will come in as strings, and will need to be converted to floats.
Will use numerics to process the calcuation.
Output will be a string printed to the user.  


Algorithm/Pseudo-Code
-------------
START

GET loan amount from user
  - IF amount entered is valid (a positive integer or float)
    - SET loan_amt
  - ELSE re-prompt the user for a valid loan amount

GET APR from user (must be expressed as a percentage, so 5 instead of 0.05)
  - IF amount entered is valid (a positive int or float)
    - SET APR
  - ELSE re-prompt the user for a valid APR

GET loan duration (in years) 
  - IF amount entered is valid (a positive int or float)
    - SET loan duration
  - ELSE re-prompt the user for a valid loan duration

SET monthly interest rate (APR / 12)
SET loan duration in months (loan duration * 12)

SET monthly payment 
PRINT monthly payment



=begin
def get_input(input)
  puts prompt(input.to_sym)
  loop do
    case input
    when 'loan_amt'
      loan_amt = gets.chomp
      if valid?(loan_amt)
        return loan_amt.to_f.round(2)
      else
        puts prompt(:loan_amt_error)
      end
    when 'annual_rate'
      annual_rate = gets.chomp
      if valid?(annual_rate)
        return annual_rate.to_f / 100
      else
        puts prompt(:rate_error)
      end
    when 'loan_duration'
      loan_duration_in_years = gets.chomp
      if valid?(loan_duration_in_years)
        return loan_duration_in_years.to_f
      else
        puts prompt(:duration_error)
      end
    end
  end
end
=end
