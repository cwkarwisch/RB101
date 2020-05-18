EMPTY_MARKER = ' '
PLAYER_MARKER = 'o'
COMPUTER_MARKER = 'x'

MESSAGES = {
  en: {
    welcome: "Welcome to Tic-Tac-Toe!",
    plays_first: "Who would you like to go first? Enter 'player', \
'computer', or 'random'.",
    goes_first: "OK, the %s will go first.",
    instructions: "To make a move, enter the number that corresponds to the \
square on the board
   that you would like to select. Enter '1' for the upper-left square,
   '2' for the upper-center square, etc.",
    x_and_o2: "Your moves will be displayed as 'o' and the computer's moves \
as 'x'.",
    x_and_o: "Your moves are displayed as 'o' and the
   computer's moves are displayed as 'x'.",
    available_moves: "Please select a square.
   To see a display of what to enter for possible moves, enter 'key'.
   Currently available moves are %s.",
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
    score: "The score is now:
   Player: %i
   Computer: %i",
    first: ['player', 'computer', 'random'],
    random: "random",
    random_choice: ['player', 'computer'],
    delimiter: ", ",
    separating_word: "and"
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
  puts message
  puts ""
end

def display_board(board)
  puts "          #{board[1]} | #{board[2]} | #{board[3]}"
  puts "          ----------"
  puts "          #{board[4]} | #{board[5]} | #{board[6]}"
  puts "          ----------"
  puts "          #{board[7]} | #{board[8]} | #{board[9]}"
  puts ""
end

def board_with_possible_moves(board)
  possible_moves = {}
  board.each do |key, value|
    possible_moves[key] = if value == EMPTY_MARKER
                            key.to_s
                          else
                            value
                          end
  end
  possible_moves
end

def computer_move!(board)
  if computer_first_turn?(board)
    ai_opening_move!(board)
  elsif winning_move_available?(board, COMPUTER_MARKER)
    ai_winning_move!(board)
  elsif winning_move_available?(board, PLAYER_MARKER)
    ai_defensive_move!(board)
  else
    random_move!(board)
  end
end

def computer_first_turn?(board)
  board.values.count(COMPUTER_MARKER) == 0
end

def random_move!(board)
  available_moves = array_of_available_choices(board)
  computer_choice = available_moves.sample
  board[computer_choice] = COMPUTER_MARKER
end

def ai_opening_move!(board)
  if board[5] == EMPTY_MARKER
    board[5] = COMPUTER_MARKER
  else
    computer_choice = array_of_available_corners(board).sample
    board[computer_choice] = COMPUTER_MARKER
  end
end

def array_of_available_corners(board)
  available = array_of_available_choices(board)
  available.delete(2)
  available.delete(4)
  available.delete(6)
  available.delete(8)
  available
end

def ai_winning_move!(board)
  winning_move = find_ai_move(board, 'offense')
  board[winning_move] = COMPUTER_MARKER
end

def find_ai_move(board, strategy)
  marker_being_checked = COMPUTER_MARKER if strategy == 'offense'
  marker_being_checked = PLAYER_MARKER if strategy == 'defense'
  find_move_location(board, marker_being_checked)
end

def find_move_location(board, marker_being_checked)
  WINNING_MOVES.each do |sub_arr|
    marker_count = 0
    empty_count = 0
    move = 0
    sub_arr.each do |num|
      marker_count += 1 if board[num] == marker_being_checked
      empty_count += 1 if board[num] == EMPTY_MARKER
      move = num if board[num] == EMPTY_MARKER
    end
    return move if marker_count == 2 && empty_count == 1
  end
end

def ai_defensive_move!(board)
  defensive_move = find_ai_move(board, 'defense')
  board[defensive_move] = COMPUTER_MARKER
end

def winning_move_available?(board, marker_being_checked)
  WINNING_MOVES.each do |sub_arr|
    move_count = 0
    empty_count = 0
    sub_arr.each do |num|
      move_count += 1 if board[num] == marker_being_checked
      empty_count += 1 if board[num] == EMPTY_MARKER
    end
    return true if move_count == 2 && empty_count == 1
  end
  false
end

def winner?(board, player_to_check)
  marker_to_check = if player_to_check == 'player'
                      PLAYER_MARKER
                    else
                      COMPUTER_MARKER
                    end
  player_moves = board.select { |_, value| value == marker_to_check }.keys
  WINNING_MOVES.any? do |sub_arr|
    sub_arr.all? do |num|
      player_moves.include?(num)
    end
  end
end

def tie?(board)
  board.values.include?(EMPTY_MARKER) ? false : true
end

def play_again?
  prompt_with_newline(MESSAGES[LANGUAGE][:again?])
  response = ''
  loop do
    response = gets.chomp.downcase
    puts
    if valid_yes_or_no?(response)
      return valid_yes?(response)
    else
      prompt_with_newline(MESSAGES[LANGUAGE][:invalid_choice])
    end
  end
end

def valid_yes_or_no?(response)
  MESSAGES[LANGUAGE][:valid_yes_or_no].values.flatten.include?(response)
end

def valid_yes?(response)
  MESSAGES[LANGUAGE][:valid_yes_or_no][:yes].include?(response)
end

def valid_choice?(choice, board)
  return false unless choice.to_i.to_s == choice
  (1..9).to_a.include?(choice.to_i) && board[choice.to_i] == EMPTY_MARKER
end

def array_of_available_choices(board)
  available = board.select { |_, value| value == EMPTY_MARKER }
  available.keys
end

def create_clear_board
  {
    1 => EMPTY_MARKER,
    2 => EMPTY_MARKER,
    3 => EMPTY_MARKER,
    4 => EMPTY_MARKER,
    5 => EMPTY_MARKER,
    6 => EMPTY_MARKER,
    7 => EMPTY_MARKER,
    8 => EMPTY_MARKER,
    9 => EMPTY_MARKER
  }
end

def log_player_move!(board, player_move)
  board[player_move.to_i] = PLAYER_MARKER
end

def joinor(array, delimiter, joining_word)
  string = ""
  counter = 0
  loop do
    break if counter == array.size
    string << joining_word << " " if counter == array.size - 1
    string << array[counter].to_s
    string << delimiter unless counter == array.size - 1
    counter += 1
  end
  string
end

def welcome_user
  prompt_with_newline(MESSAGES[LANGUAGE][:welcome])
  prompt_with_newline(MESSAGES[LANGUAGE][:instructions])
end

def create_empty_scoreboard
  {
    player: 0,
    computer: 0
  }
end

def update_score!(scoreboard, winner)
  scoreboard[winner] += 1
end

def display_scoreboard(scoreboard)
  prompt_with_newline(format(MESSAGES[LANGUAGE][:score], scoreboard[:player],
                             scoreboard[:computer]))
end

def five_wins?(scoreboard)
  scoreboard[:player] == 5 || scoreboard[:computer] == 5 ? true : false
end

def display_available_moves(board)
  display_board(board)
  prompt_with_newline(MESSAGES[LANGUAGE][:x_and_o])
  prompt_with_newline(list_of_available_moves(board))
end

def list_of_available_moves(board)
  format(MESSAGES[LANGUAGE][:available_moves],
         joinor(array_of_available_choices(board),
                MESSAGES[LANGUAGE][:delimiter],
                MESSAGES[LANGUAGE][:separating_word]))
end

def display_key(board)
  display_board(board_with_possible_moves(board))
  prompt_with_newline(list_of_available_moves(board))
end

def player_move!(board)
  loop do
    display_available_moves(board)
    player_choice = gets.chomp
    if MESSAGES[LANGUAGE][:key] == player_choice
      display_key(board)
      player_choice = gets.chomp
    end

    if valid_choice?(player_choice, board)
      log_player_move!(board, player_choice)
      break
    else
      puts
      prompt_with_newline(MESSAGES[LANGUAGE][:invalid_choice])
    end
  end
end

def mark_a_square!(board, player_moving)
  if player_moving == 'computer'
    computer_move!(board)
  else
    player_move!(board)
    clear_terminal
  end
end

def alternate_player!(current)
  if current == 'player'
    current.replace('computer')
  else
    current.replace('player')
  end
end

def display_winner(winner)
  if winner == 'player'
    prompt_with_newline(MESSAGES[LANGUAGE][:player_win])
  else
    prompt_with_newline(MESSAGES[LANGUAGE][:computer_win])
  end
end

def ask_who_plays_first
  response = ''
  loop do
    prompt_with_newline(MESSAGES[LANGUAGE][:plays_first])
    response = gets.chomp.downcase
    puts
    break if valid_player?(response)
    prompt_with_newline(MESSAGES[LANGUAGE][:invalid_choice])
  end
  if response == MESSAGES[LANGUAGE][:random]
    response = random_choice
  end
  response
end

def valid_player?(player)
  MESSAGES[LANGUAGE][:first].include?(player)
end

def random_choice
  MESSAGES[LANGUAGE][:random_choice].sample
end

# game loop
score = create_empty_scoreboard
current_player = ''

loop do
  clear_terminal
  prompt_with_newline(MESSAGES[LANGUAGE][:welcome])
  current_player = ask_who_plays_first
  clear_terminal
  prompt_with_newline(format(MESSAGES[LANGUAGE][:goes_first], current_player))
  prompt_with_newline(MESSAGES[LANGUAGE][:instructions])
  game_board = create_clear_board

  loop do
    mark_a_square!(game_board, current_player)

    if winner?(game_board, current_player)
      clear_terminal
      display_board(game_board)
      update_score!(score, current_player.to_sym)
      display_winner(current_player)
      display_scoreboard(score)
      break
    end

    if tie?(game_board)
      clear_terminal
      display_board(game_board)
      prompt_with_newline(MESSAGES[LANGUAGE][:tie])
      display_scoreboard(score)
      break
    end

    alternate_player!(current_player)
  end

  break if five_wins?(score)
  again = play_again?
  break unless again
end

prompt_with_newline(MESSAGES[LANGUAGE][:goodbye])
