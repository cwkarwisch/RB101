# These messages could be emitted to a YAML file for ease of configuration.
# For ease of review, I have left the messages here in the .rb file.
MESSAGES = {
  en: {
    welcome: "=> Welcome to the loan calculator.",
    loan_amt: "=> What is the amount of your loan? (Don't include the $ sign)",
    loan_amt_error: "=> That doesn't look like a valid loan amount. Please
    try again and remember not to include the $ sign.",
    annual_rate: "=> What is your annual percentage rate (APR)?
    (For example, please input 5% as 5, not 0.05)",
    rate_error: "=> That doesn't look like a valid interest rate. \
Please try again and make sure to leave off the % sign.",
    loan_duration: "=> What is the duration of your loan in years?",
    duration_error: "=> That doesn't look like a valid loan duration.\
Please try again.",
    confirmation: "=> It looks like your loan amount is ${loan_amt}, \
your annual percentage rate is {annual_rate}%,
   and your loan duration is {loan_duration} years.
   Press 'Y' to confirm.",
    monthly_payment: "=> Based on those figures, your monthly payment will be \
${monthly_payment}"
  }
}
LANGUAGE = :en

# function to return messages to the user, which are printed throughout the
# program with puts
def prompt(message)
  MESSAGES[LANGUAGE][message]
end

# function to space out prompts
def space_prompts
  puts ""
end

# functions to validate inputs from the user

# checks that the input consists of some number of digits
def valid_int?(num)
  num =~ /^\d+$/
end

# checks that the input follows one of the following formats:
# {1 or more digits}.{2 digits} | {1 or more digits}.{1 digit} |
# {1 or more digits}. | .{1 digit} | .{2 digits}
def dollar_format?(num)
  num =~ /^\d+[.]\d{2}$|^\d+[.]\d{1}$|^\d+[.]$|^[.]\d{1}$|^[.]\d{2}/
end

# checks that the input is a positive dollar amt
# only used to validate the loan amt
def valid_dollar_amt?(num)
  num.to_f.positive? && (valid_int?(num) || dollar_format?(num))
end

# checks that the input follows one of the following formats:
# {one or more digits}.{one or more digits} | {one or more digits}. |
# .{one or more digits}
def valid_float?(num)
  num =~ /^\d+[.]\d+$|^\d+[.]{1}$|^[.]\d+$/
end

# checks that the input is a positive int or float
# used to validate the annual rate and loan duration
def valid?(num)
  num.to_f.positive? && (valid_int?(num) || valid_float?(num))
end

# function to properly format the loan amount and monthly payment with commas
# for the thousands separator and two decimal places
def add_commas(num_string)
  formatted_string = num_string.reverse.scan(%r/\d{3}|
    \d{1}[.]\d{3}|\d{2}[.]\d{3}|.+/x).join(",").reverse
  formatted_string << '0' if formatted_string =~ /[.]\d{1}$/
  formatted_string
end

# gets loan amt from user
def ask_for_loan_amt
  puts prompt(:loan_amt)
  loop do
    loan_amt = gets.chomp
    if valid_dollar_amt?(loan_amt)
      return loan_amt.to_f.round(2)
    else
      space_prompts
      puts prompt(:loan_amt_error)
    end
  end
end

# gets annual rate from user
def ask_for_annual_rate
  puts prompt(:annual_rate)
  loop do
    annual_rate = gets.chomp
    if valid?(annual_rate)
      return annual_rate.to_f
    else
      space_prompts
      puts prompt(:rate_error)
    end
  end
end

# gets loan duration from user
def ask_for_loan_duration
  puts prompt(:loan_duration)
  loop do
    loan_duration_in_years = gets.chomp
    if valid?(loan_duration_in_years)
      return loan_duration_in_years.to_f
    else
      space_prompts
      puts prompt(:duration_error)
    end
  end
end

# Confirm the user's information is correct
def confirm_input(loan_amt, annual_rate, loan_duration_in_years)
  puts prompt(:confirmation).sub('{loan_amt}', add_commas(loan_amt.to_s))\
    .sub('{annual_rate}', annual_rate.to_s)\
    .sub('{loan_duration}', loan_duration_in_years.to_s)
  gets.chomp
end

# clear the terminal when program begins
system "clear"
space_prompts
puts prompt(:welcome)
loan_amt = 0
annual_rate = 0
loan_duration_in_years = 0

# main loop
loop do
  # get loan information from user
  space_prompts
  loan_amt = ask_for_loan_amt
  space_prompts
  annual_rate = ask_for_annual_rate
  space_prompts
  loan_duration_in_years = ask_for_loan_duration

  # Confirm the user's information is correct
  space_prompts
  confirmation = confirm_input(loan_amt, annual_rate, loan_duration_in_years)
  break if confirmation.downcase.start_with?('y')
end

# Convert annual to monthly rate by dividing by 12 and put in proper decimal
# format by dividing by 100 (e.g., changing 5% to 0.05)
monthly_rate = annual_rate / 12 / 100
loan_duration_in_months = loan_duration_in_years * 12

# calculate and display the monthly payment to the user
monthly_payment = loan_amt * (monthly_rate / (1 - (1 + monthly_rate)**\
  (-loan_duration_in_months)))
space_prompts
puts prompt(:monthly_payment).sub('{monthly_payment}',
                                  add_commas(monthly_payment.round(2).to_s))
space_prompts
