require 'Psych'

# messages to be moved over to the config file once it works
messages = {
  en: {
    welcome: '>>> Welcome to Calculator. Enter your name:',
    name_error: '>>> Make sure to use a valid name.',
    first_number: ">>> What's the first number?", 
    second_number: ">>> What's the second number?", 
    number_error: ">>> Hmm... that doesn't look like a valid number.",
    operator_prompt:  ">>> What operation would you like to perform?
      1) add
      2) subtract
      3) multiply
      4) divide", 
    operator_selection_error: "Must choose 1, 2, 3, or 4",
    operation_status_1: ">>> Adding the two numbers...",
    operation_status_2: ">>> Subtracting the two numbers...",
    operation_status_3: ">>> Multiplying the two numbers...",
    operation_status_4: ">>> Dividing the two numbers...",
    result: ">>> The result is ",
    another?: ">>> Do you want to perform another calculation? (Y to calculate again)",
    thanks: ">>> Thank you for using Calculator. Goodbye!",
  }
}

File.open('calc_config.yml', 'w') { |file| file.write(Psych.dump(messages))}