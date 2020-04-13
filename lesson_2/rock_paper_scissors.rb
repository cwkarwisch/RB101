VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNING_HANDS = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['spock', 'paper'],
  spock: ['rock', 'scissors']
}

MESSAGES = {
  welcome: "Welcome to the game.",
  choose: "Choose one: %{choices}",
  win: "You won!",
  loss: "You lost!",
  tie: "Its a tie!",
  confirm: "Did you want to pick scissors or spock? (Enter at least either \
'sc' or 'sp')",
  invalid: "That doesn't look like a valid choice.",
  score_update: "The score is now:
Player: %{player_score}
Computer: %{computer_score}",
  player_wins: "You are the Grand Winner!",
  computer_wins: "The computer is the Grand Winner! Better luck next time.",
  results: "You chose %{player_choice} and the computer chose \
%{computer_choice}.",
  again?: "Do you want to play again?",
  goodbye: "Thank you for playing! Goodbye."
}

def prompt(message)
  puts "=> " + message
end

def space_prompts
  puts ""
end

def valid_choice?(choice)
  return true if VALID_CHOICES.include?(choice)
  return true if choice.downcase.start_with?('r', 'p', 's', 'l')
  false
end

def confirm_choice
  confirmed_choice = ''
  loop do
    space_prompts
    prompt MESSAGES[:confirm]
    confirmed_choice = gets.chomp
    break if confirmed_choice.downcase.start_with?('sc', 'sp')
    space_prompts
    prompt MESSAGES[:invalid]
  end
  confirmed_choice
end

def format_choice(choice)
  return 'rock' if choice.downcase.start_with?('r')
  return 'paper' if choice.downcase.start_with?('p')
  return 'scissors' if choice.downcase.start_with?('sc')
  return 'lizard' if choice.downcase.start_with?('l')
  return 'spock' if choice.downcase.start_with?('sp')
end

def display_results(player, computer)
  # check whether the player's move beats the computer's move
  if WINNING_HANDS[player.to_sym].include?(computer)
    space_prompts
    prompt(MESSAGES[:win])
  # check whether the computer's move beats the player's move
  elsif WINNING_HANDS[computer.to_sym].include?(player)
    space_prompts
    prompt(MESSAGES[:loss])
  # otherwise there is a tie
  else
    space_prompts
    prompt(MESSAGES[:tie])
  end
end

def update_score(player, computer, score)
  if WINNING_HANDS[player.to_sym].include?(computer)
    score[:player] += 1
  elsif WINNING_HANDS[computer.to_sym].include?(player)
    score[:computer] += 1
  end
  space_prompts
  prompt format(MESSAGES[:score_update], player_score:
                         score[:player], computer_score: score[:computer])
end

def grand_winner?(score)
  if score[:player] == 5 || score[:computer] == 5
    true
  else
    false
  end
end

def display_grand_winner(score)
  if score[:player] == 5
    space_prompts
    prompt MESSAGES[:player_wins]
  elsif score[:computer] == 5
    space_prompts
    prompt MESSAGES[:computer_wins]
  end
end

# clear the terminal and welcome the player
system "clear"
prompt MESSAGES[:welcome]
space_prompts

# set each player's score to 0
scores = {
  player: 0,
  computer: 0
}

# main loop
loop do
  # loop to obtain the player's move
  player_choice = ''
  loop do
    # display the available choices to the player
    prompt format(MESSAGES[:choose], choices: VALID_CHOICES.join(', '))
    player_choice = gets.chomp

    # validate the player's move
    if valid_choice?(player_choice)

      # confirm the player's move if they only entered 's'
      player_choice = confirm_choice if player_choice.downcase == 's'

      # format the player's move if they entered less than the full word
      player_choice = format_choice(player_choice) unless
        VALID_CHOICES.include?(player_choice)
      break

    # let the user know their choice was invalid
    else
      space_prompts
      prompt MESSAGES[:invalid]
    end
  end

  # set the computer's random choice
  computer_choice = VALID_CHOICES.sample

  # display each player's move, who won, and update the score
  space_prompts
  prompt format(MESSAGES[:results], player_choice:
                player_choice, computer_choice: computer_choice)
  display_results(player_choice, computer_choice)
  update_score(player_choice, computer_choice, scores)

  # determine if either play has won 5 matches
  # if so, the game is over
  if grand_winner?(scores)
    display_grand_winner(scores)
    break
  end

  # ask if the user wants to play again
  space_prompts
  prompt MESSAGES[:again?]
  answer = gets.chomp
  space_prompts
  break unless answer.downcase.start_with?('y')
end

# display farewell message
prompt MESSAGES[:goodbye]
space_prompts
