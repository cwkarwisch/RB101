require 'Psych'

MESSAGES = {
  en: {
    welcome: "Welcome to the game.",
    choose: "Choose one: %{choices}.",
    instructions: "When entering your move, feel free to enter 'r' for rock, \
  'p' for paper, and so on,
     but make to sure to enter at least 'sc' or 'sp' for scissors or spock.
     It's also fine to enter less than the full word, such as 'liz' for lizard.",
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
    again?: "Do you want to play again? Enter 'y' or 'n'.",
    y_or_n: "That doesn't look like a valid choice.
     Enter 'y' to play again or 'n' to quit.",
    goodbye: "Thank you for playing! Goodbye."
  }
}

File.open('rps_messages.yml', 'w') { |file| file.write(Psych.dump(MESSAGES))}