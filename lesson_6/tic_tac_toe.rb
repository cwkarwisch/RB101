EMPTY_MARKER = ' '
PLAYER_MARKER = 'o'
COMPUTER_MARKER = 'x'

MESSAGES = {
  en: {
    welcome: "Welcome to Tic-Tac-Toe!",
    instructions: "To make a move, enter the number that corresponds to the \
square on the board
   that you would like to select. Enter '1' for the upper-left square,
   '2' for the upper-center square, etc. Enter 'key' for a diagram.",
    x_and_o2: "Your moves will be displayed as 'o' and the computer's moves \
as 'x'.",
    x_and_o: "Your moves are displayed as 'o' and the
   computer's moves are displayed as '#{COMPUTER_MARKER}'.",
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
   Computer: %i"
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

def display_board(moves)
  puts "          #{moves[1]} | #{moves[2]} | #{moves[3]}"
  puts "          ----------"
  puts "          #{moves[4]} | #{moves[5]} | #{moves[6]}"
  puts "          ----------"
  puts "          #{moves[7]} | #{moves[8]} | #{moves[9]}"
  puts ""
end

def board_with_possible_moves(moves)
  possible_moves = {}
  moves.each do |key, value|
    possible_moves[key] = if value == EMPTY_MARKER
                            key.to_s
                          else
                            value
                          end
  end
  possible_moves
end

# abstract out the available choices piece??
def computer_move!(moves)
  available_choices = moves.select { |_, value| value == EMPTY_MARKER }.keys
  computer_choice = available_choices.sample
  moves[computer_choice] = COMPUTER_MARKER
end


# should we have a detect winner method rather than relying on
# where we are in the loop?
def winner?(moves, player_to_check)
  player_moves = moves.select { |_, value| value == player_to_check }.keys
  WINNING_MOVES.any? do |sub_arr|
    sub_arr.all? do |num|
      player_moves.include?(num)
    end
  end
end

def tie?(moves)
  moves.values.include?(EMPTY_MARKER) ? false : true
end

def play_again?
  prompt_with_newline(MESSAGES[LANGUAGE][:again?])
  response = ''
  loop do
    response = gets.chomp.downcase
    puts
    if MESSAGES[LANGUAGE][:valid_yes_or_no].values.flatten.include?(response)
      break
    else
      prompt_with_newline(MESSAGES[LANGUAGE][:invalid_choice])
    end
  end
  MESSAGES[LANGUAGE][:valid_yes_or_no][:yes].include?(response) ? true : false
end

def valid_choice?(choice, moves)
  return false unless choice.to_i.to_s == choice
  (1..9).to_a.include?(choice.to_i) && moves[choice.to_i] == EMPTY_MARKER
end

def array_of_available_choices(moves)
  available = moves.select { |_, value| value == EMPTY_MARKER}
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

def log_player_move!(moves, player_move)
  moves[player_move.to_i] = PLAYER_MARKER
end

def joinor(array, delimiter, joining_word)
  string = ""
  counter = 0
  loop do
    break if counter == array.size
    string << joining_word  << " " if counter == array.size - 1
    string << array[counter].to_s
    string << delimiter unless counter == array.size - 1
    counter += 1
  end
  string
end

def welcome_user
  prompt_with_newline(MESSAGES[LANGUAGE][:welcome])
  prompt_with_newline(MESSAGES[LANGUAGE][:instructions])
  prompt_with_newline(MESSAGES[LANGUAGE][:x_and_o])
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

score = create_empty_scoreboard

loop do
  clear_terminal
  welcome_user
  moves_hash = create_clear_board #rename moves_hash to something cleaner?

  loop do
    loop do
      display_board(moves_hash)
      prompt_with_newline(format(MESSAGES[LANGUAGE][:available_moves],
                          joinor(array_of_available_choices(moves_hash),
                          ', ', 'and')))

      player_choice = gets.chomp
      if MESSAGES[LANGUAGE][:key] == player_choice
        display_board(board_with_possible_moves(moves_hash))
        prompt_with_newline(format(MESSAGES[LANGUAGE][:available_moves],
        joinor(array_of_available_choices(moves_hash),
        ', ', 'and')))
        player_choice = gets.chomp
      end

      if valid_choice?(player_choice, moves_hash)
        log_player_move!(moves_hash, player_choice)
        break
      else
        puts
        prompt_with_newline(MESSAGES[LANGUAGE][:invalid_choice])
      end
    end

    if winner?(moves_hash, PLAYER_MARKER)
      # we do clear terminal and display board a lot, condense into a method??
      clear_terminal
      display_board(moves_hash)
      update_score!(score, :player)
      prompt_with_newline(MESSAGES[LANGUAGE][:player_win])
      display_scoreboard(score)
      break
    end

    if tie?(moves_hash)
      clear_terminal
      display_board(moves_hash)
      prompt_with_newline(MESSAGES[LANGUAGE][:tie])
      break
    end

    computer_move!(moves_hash)
    if winner?(moves_hash, COMPUTER_MARKER)
      clear_terminal
      display_board(moves_hash)
      update_score!(score, :computer)
      prompt_with_newline(MESSAGES[LANGUAGE][:computer_win])
      display_scoreboard(score)
      break
    end

    if tie?(moves_hash)
      clear_terminal
      display_board(moves_hash)
      prompt_with_newline(MESSAGES[LANGUAGE][:tie])
      break
    end

    clear_terminal
  end

  break if five_wins?(score)
  again = play_again?
  break unless again
end

prompt_with_newline(MESSAGES[LANGUAGE][:goodbye])
