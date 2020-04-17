require 'psych'
MESSAGES = Psych.load_file('rps_messages.yml')
LANGUAGE = :en

MOVES = {
  'choices' => %w(rock paper scissors lizard spock),
  'permutations' => ['r', 'ro', 'roc', 'rock', 'p', 'pa', 'pap', 'pape',
                     'paper', 's', 'sc', 'sci', 'scis', 'sciss', 'scisso',
                     'scissor', 'scissors', 'l', 'li', 'liz', 'liza', 'lizar',
                     'lizard', 'sp', 'spo', 'spoc', 'spock'],
  'unclear_response' => 's',
  'stop_playing' => ['n', 'no'],
  'valid_s_choices' => ['sc', 'sci', 'scis', 'sciss', 'scisso', 'scissor',
                        'scissors', 'sp', 'spo', 'spoc', 'spock'],
  'rock' => {
    beats: ['scissors', 'lizard'],
    permutations: ['r', 'ro', 'roc', 'rock']
  },
  'paper' => {
    beats: ['rock', 'spock'],
    permutations: ['p', 'pa', 'pap', 'pape', 'paper']
  },
  'scissors' => {
    beats: ['paper', 'lizard'],
    permutations: ['s', 'sc', 'sci', 'scis', 'sciss', 'scisso', 'scissor',
                   'scissors']
  },
  'lizard' => {
    beats: ['spock', 'paper'],
    permutations: ['l', 'li', 'liz', 'liza', 'lizar', 'lizard']
  },
  'spock' => {
    beats: ['rock', 'scissors'],
    permutations: ['s', 'sp', 'spo', 'spoc', 'spock']
  }
}

VALID_YES_OR_NO = ['yes', 'y', 'no', 'n']

def clear_terminal
  system('clear') || system('cls')
end

def prompt(message)
  puts "=> " + message
  puts ""
end

def space_prompts
  puts ""
end

def valid_choice?(choice)
  return true if MOVES['permutations'].include?(choice)
  false
end

def confirm_choice
  confirmed_choice = ''
  loop do
    prompt MESSAGES[LANGUAGE][:confirm]
    confirmed_choice = gets.chomp
    break if MOVES['valid_s_choices'].include?(confirmed_choice)
    prompt MESSAGES[LANGUAGE][:invalid]
  end
  confirmed_choice
end

def format_choice(choice)
  return 'rock' if MOVES['rock'][:permutations].include?(choice)
  return 'paper' if MOVES['paper'][:permutations].include?(choice)
  return 'scissors' if MOVES['scissors'][:permutations].include?(choice)
  return 'lizard' if MOVES['lizard'][:permutations].include?(choice)
  return 'spock' if MOVES['spock'][:permutations].include?(choice)
end

def display_results(player, computer)
  if MOVES[player][:beats].include?(computer)
    prompt(MESSAGES[LANGUAGE][:win])
  elsif MOVES[computer][:beats].include?(player)
    prompt(MESSAGES[LANGUAGE][:loss])
  else
    prompt(MESSAGES[LANGUAGE][:tie])
  end
end

def update_score(player, computer, score)
  if MOVES[player][:beats].include?(computer)
    score[:player] += 1
  elsif MOVES[computer][:beats].include?(player)
    score[:computer] += 1
  end
  prompt format(MESSAGES[LANGUAGE][:score_update], player_score:
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
    prompt MESSAGES[LANGUAGE][:player_wins]
  elsif score[:computer] == 5
    prompt MESSAGES[LANGUAGE][:computer_wins]
  end
end

clear_terminal
prompt MESSAGES[LANGUAGE][:welcome]
prompt MESSAGES[LANGUAGE][:instructions]

scores = {
  player: 0,
  computer: 0
}

# main loop
loop do
  player_choice = ''
  loop do
    prompt format(MESSAGES[LANGUAGE][:choose], choices:
           MOVES['choices'].join(', '))
    player_choice = gets.chomp.downcase
    puts ""

    if valid_choice?(player_choice)
      player_choice = confirm_choice if player_choice.downcase ==
                                        MOVES['unclear_response']
      player_choice = format_choice(player_choice) unless
        MOVES['choices'].include?(player_choice)
      break

    else
      prompt MESSAGES[LANGUAGE][:invalid]
    end
  end

  computer_choice = MOVES['choices'].sample
  prompt format(MESSAGES[LANGUAGE][:results], player_choice:
                player_choice, computer_choice: computer_choice)
  display_results(player_choice, computer_choice)
  update_score(player_choice, computer_choice, scores)

  if grand_winner?(scores)
    display_grand_winner(scores)
    break
  end

  prompt MESSAGES[LANGUAGE][:again?]
  answer = ''
  loop do
    answer = gets.chomp
    puts ""
    if !VALID_YES_OR_NO.include?(answer.downcase)
      prompt MESSAGES[LANGUAGE][:y_or_n]
    else
      break
    end
  end
  break if MOVES['stop_playing'].include?(answer.downcase)
  clear_terminal
end

prompt MESSAGES[LANGUAGE][:goodbye]
