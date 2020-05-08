MESSAGES = {
  en: {
    welcome: "Welcome to Tic-Tac-Toe!",
    instructions: "To make a move, enter the number that corresponds to the square on the board that you would like to select.
   Enter '1' for the upper-left square, '2' for the upper-center square, etc. Enter 'key' for a diagram.
   Your moves will be displayed as 'o' and the computer's moves as 'x'.",
    move: "Please select a square.
   To see a display of what to enter for possible moves, enter 'key'.",
    possible_moves: "To see a display of what to enter for possible moves, enter 'key'.",
    invalid_choice: "That doesn't look like a valid choice. Please try again.",
    player_win: "You won! Congratulations!",
    computer_win: "The compuer won. Better luck next time!",
    again?: "Would you like to play again? Enter y or n.",
    goodbye: "Thank you for playing. Goodbye!",
    tie: "It's a tie!",
    valid_yes_or_no: {
      yes: ['yes', 'y'],
      no: ['no', 'n']
    },
    key: "key",
  }
}

LANGUAGE = :en

WINNING_MOVES = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [1, 5, 9],
  [3, 5, 7]
]

def clear_terminal
  system('clear') || system('cls')
end

def prompt_with_newline(message)
  print "=> "
  puts MESSAGES[LANGUAGE][message]
  puts ""
end

def display_board_with_possble_moves(moves)
  print " " * 10
  print " "
  print "1" if moves[1] == "empty"
  print "o" if moves[1] == "player"
  print "x" if moves[1] == "computer"
  print " "
  print "|"
  print " "
  print " "
  print "2" if moves[2] == "empty"
  print "o" if moves[2] == "player"
  print "x" if moves[2] == "computer"
  print " "
  print "|"
  print " "
  print "3" if moves[3] == "empty"
  print "o" if moves[3] == "player"
  print "x" if moves[3] == "computer"
  puts ""

  print " " * 10
  print "------------"
  puts ""

  print " " * 10
  print " "
  print "4" if moves[4] == "empty"
  print "o" if moves[4] == "player"
  print "x" if moves[4] == "computer"
  print " "
  print "|"
  print " "
  print " "
  print "5" if moves[5] == "empty"
  print "o" if moves[5] == "player"
  print "x" if moves[5] == "computer"
  print " "
  print "|"
  print " "
  print "6" if moves[6] == "empty"
  print "o" if moves[6] == "player"
  print "x" if moves[6] == "computer"
  puts ""

  print " " * 10
  print "------------"
  puts ""

  print " " * 10
  print " "
  print "7" if moves[7] == "empty"
  print "o" if moves[7] == "player"
  print "x" if moves[7] == "computer"
  print " "
  print "|"
  print " "
  print " "
  print "8" if moves[8] == "empty"
  print "o" if moves[8] == "player"
  print "x" if moves[8] == "computer"
  print " "
  print "|"
  print " "
  print "9" if moves[9] == "empty"
  print "o" if moves[9] == "player"
  print "x" if moves[9] == "computer"
  puts ""

  print " " * 10
  puts ""
end

def display_board(moves)
  print " " * 10
  print " "
  print " " if moves[1] == "empty"
  print "o" if moves[1] == "player"
  print "x" if moves[1] == "computer"
  print " "
  print "|"
  print " "
  print " "
  print " " if moves[2] == "empty"
  print "o" if moves[2] == "player"
  print "x" if moves[2] == "computer"
  print " "
  print "|"
  print " "
  print " " if moves[3] == "empty"
  print "o" if moves[3] == "player"
  print "x" if moves[3] == "computer"
  puts ""

  print " " * 10
  print "------------"
  puts ""

  print " " * 10
  print " "
  print " " if moves[4] == "empty"
  print "o" if moves[4] == "player"
  print "x" if moves[4] == "computer"
  print " "
  print "|"
  print " "
  print " "
  print " " if moves[5] == "empty"
  print "o" if moves[5] == "player"
  print "x" if moves[5] == "computer"
  print " "
  print "|"
  print " "
  print " " if moves[6] == "empty"
  print "o" if moves[6] == "player"
  print "x" if moves[6] == "computer"
  puts ""

  print " " * 10
  print "------------"
  puts ""

  print " " * 10
  print " "
  print " " if moves[7] == "empty"
  print "o" if moves[7] == "player"
  print "x" if moves[7] == "computer"
  print " "
  print "|"
  print " "
  print " "
  print " " if moves[8] == "empty"
  print "o" if moves[8] == "player"
  print "x" if moves[8] == "computer"
  print " "
  print "|"
  print " "
  print " " if moves[9] == "empty"
  print "o" if moves[9] == "player"
  print "x" if moves[9] == "computer"
  puts ""

  print " " * 10
  puts ""
end

def computer_move(moves)
  available_choices_array = moves.select { |_, value| value == 'empty' }.keys
  computer_choice = available_choices_array.sample
  moves[computer_choice] = 'computer'
end

def winner?(moves, player_to_check)
  player_moves = moves.select {|_, value| value == player_to_check}.keys
  WINNING_MOVES.any? do |sub_arr|
    sub_arr.all? do |num|
      player_moves.include?(num)
    end
  end
end

def tie?(moves)
  moves.values.include?('empty') ? false : true
end

def play_again?
  prompt_with_newline(:again?)
  response = ''
  loop do
    response = gets.chomp
    puts
    if MESSAGES[LANGUAGE][:valid_yes_or_no].values.flatten.include?(response)
      break
    else
      prompt_with_newline(:invalid_choice)
    end
  end
  MESSAGES[LANGUAGE][:valid_yes_or_no][:yes].include?(response) ? true : false
end

def valid_choice?(choice, moves)
  return false unless choice.to_i.to_s == choice
  (1..9).to_a.include?(choice.to_i) && moves[choice.to_i] == "empty"
end

def create_clear_board
  {
    1 => "empty",
    2 => "empty",
    3 => "empty",
    4 => "empty",
    5 => "empty",
    6 => "empty",
    7 => "empty",
    8 => "empty",
    9 => "empty"
  }
end

def log_player_move(moves, player_move)
  moves[player_move.to_i] = "player"
end

loop do
  clear_terminal
  prompt_with_newline(:welcome)
  prompt_with_newline(:instructions)
  moves_hash = create_clear_board
  again = false

  loop do
    loop do
      display_board(moves_hash)
      prompt_with_newline(:move)

      player_choice = gets.chomp
      if MESSAGES[LANGUAGE][:key] == player_choice
        display_board_with_possble_moves(moves_hash)
        prompt_with_newline(:move)
        player_choice = gets.chomp
      end

      if valid_choice?(player_choice, moves_hash)
        log_player_move(moves_hash, player_choice)
        break
      else
        puts
        prompt_with_newline(:invalid_choice)
      end
    end

    if winner?(moves_hash, 'player')
      clear_terminal
      display_board(moves_hash)
      prompt_with_newline(:player_win)
      break
    end

    if tie?(moves_hash)
      clear_terminal
      display_board(moves_hash)
      prompt_with_newline(:tie)
      break
    end

    computer_move(moves_hash)
    if winner?(moves_hash, 'computer')
      clear_terminal
      display_board(moves_hash)
      prompt_with_newline(:computer_win)
      break
    end

    if tie?(moves_hash)
      clear_terminal
      display_board(moves_hash)
      prompt_with_newline(:tie)
      break
    end

    clear_terminal
  end

  again = play_again?
  break unless again
end

prompt_with_newline(:goodbye)
