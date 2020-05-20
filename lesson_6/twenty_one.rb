QUARTER_DECK = [
  { name: "2", value: 2 },
  { name: "3", value: 3 },
  { name: "4", value: 4 },
  { name: "5", value: 5 },
  { name: "6", value: 6 },
  { name: "7", value: 7 },
  { name: "8", value: 8 },
  { name: "9", value: 9 },
  { name: "10", value: 10 },
  { name: "Jack", value: 10 },
  { name: "Queen", value: 10 },
  { name: "King", value: 10 },
  { name: "Ace", value: 11 }
]

MESSAGES = {
  en: {
    welcome: "Welcome to Twenty-One!",
    dealing:  "Dealing cards...",
    dealer_opening_hand: "Dealer has: %s and an unknown card.",
    player_hand: "You have: %s and %s.",
    player_bust: "You busted...",
    dealer_bust: "The dealer busted...",
    hit_or_stay?: "Would you like to hit or stay?",
    instructions: "Enter 'hit' (or just 'h') or 'stay' (or just 's').",
    player_draw: "You drew a %s.",
    dealer_draw: "Dealer drew a %s...",
    player_hand_value: "Your cards now add up to %s.",
    dealer_hand_value: "The Dealer's cards now add up to %s.",
    invalid_choice: "Sorry that's not a valid choice.",
    dealer_shows_hand: "The Dealer flips over its second card: \
Dealer has %s and %s.",
    player_win: "You win!",
    dealer_win: "The dealer won. Better luck next time!",
    tie: "It's a tie!",
    again?: "Would you like to play again?",
    goodbye: "Thank you for playing. Goodbye!",
    yes: ["yes", "y"],
    no: ["no", 'n'],
    hit: ["hit", "h"],
    stay: ['stay', 's']
  }
}

LANGUAGE = :en

def clear_terminal
  system('clear') || system('cls')
end

def prompt_with_newline(message)
  puts "=> #{message}"
  puts " "
end

def initialize_deck
  QUARTER_DECK * 4
end

def initialize_empty_hand
  []
end

def deal_starting_hands!(deck, player, dealer)
  deal_card!(deck, player)
  deal_card!(deck, dealer)
  deal_card!(deck, player)
  deal_card!(deck, dealer)
end

def deal_card!(deck, hand)
  card = deck.sample
  hand << card
  remove_card!(deck, card)
end

def remove_card!(deck, card)
  deck.each_with_index do |hash, index|
    deck.delete_at(index) if hash == card
    break if hash == card
  end
end

def change_value_of_ace!(hand)
  hand.each do |card|
    if card[:name] == "Ace" && card[:value] == 11
      card[:value] = 1
      break
    end
  end
end

def any_ace_in_hand?(hand)
  hand.any? { |card| card[:name] == "Ace" }
end

def all_aces_equal_one?(hand)
  aces = hand.select { |card| card[:name] == 'Ace' }
  aces.all? { |card| card[:value] == 1 }
end

def calculate_value_of_hand(hand)
  value = hand.reduce(0) { |hand_value, card| hand_value + card[:value] }
  if any_ace_in_hand?(hand)
    loop do
      break if value <= 21 || all_aces_equal_one?(hand)
      change_value_of_ace!(hand)
      value = hand.reduce(0) { |hand_value, card| hand_value + card[:value] }
    end
  end
  value
end

def display_last_player_card_drawn(hand)
  puts "=> " + format(MESSAGES[LANGUAGE][:player_draw], hand.last[:name])
end

def display_last_dealer_card_drawn(hand)
  puts "=> " + format(MESSAGES[LANGUAGE][:dealer_draw],
                             hand.last[:name])
end

def display_hit_or_stay
  puts "=> " + MESSAGES[LANGUAGE][:hit_or_stay?]
  prompt_with_newline(MESSAGES[LANGUAGE][:instructions])
end

def hit?(response)
  MESSAGES[LANGUAGE][:hit].include?(response)
end

def stay?(response)
  MESSAGES[LANGUAGE][:stay].include?(response)
end

def display_player_hand_value(hand)
  prompt_with_newline(format(MESSAGES[LANGUAGE][:player_hand_value],
                             calculate_value_of_hand(hand).to_s))
end

def player_hit!(deck, hand)
  deal_card!(deck, hand)
  display_last_player_card_drawn(hand)
  display_player_hand_value(hand)
end

def player_turn!(deck, hand)
  answer = nil
  loop do
    display_hit_or_stay
    answer = gets.chomp.downcase
    puts ""
    if hit?(answer)
      player_hit!(deck, hand)
      break if busted?(hand)
      next
    end
    break if stay?(answer)
    display_invalid_choice_msg
  end
end

def busted?(hand)
  calculate_value_of_hand(hand) > 21
end

def dealer_turn!(deck, hand)
  loop do
    break if dealer_stay?(hand)
    deal_card!(deck, hand)
    display_last_dealer_card_drawn(hand)
    prompt_with_newline(format(MESSAGES[LANGUAGE][:dealer_hand_value],
                             calculate_value_of_hand(hand).to_s))
  end
end

def display_dealer_hand(hand)
  prompt_with_newline(format(MESSAGES[LANGUAGE][:dealer_shows_hand],
                             hand[0][:name], hand[1][:name]))
end

def dealer_stay?(hand)
  calculate_value_of_hand(hand) >= 17
end

def determine_winner(player, dealer)
  player_score = calculate_value_of_hand(player)
  dealer_score = calculate_value_of_hand(dealer)
  if player_score > dealer_score
    "player"
  elsif dealer_score > player_score
    "dealer"
  else
    "tie"
  end
end

def display_winner(winner)
  prompt_with_newline(MESSAGES[LANGUAGE][:player_win]) if winner == 'player'
  prompt_with_newline(MESSAGES[LANGUAGE][:dealer_win]) if winner == 'dealer'
  prompt_with_newline(MESSAGES[LANGUAGE][:tie]) if winner == 'tie'
end

def welcome_player
  prompt_with_newline(MESSAGES[LANGUAGE][:welcome])
  prompt_with_newline(MESSAGES[LANGUAGE][:dealing])
end

def display_opening_hands(dealer, player)
  puts "=> " + (format(MESSAGES[LANGUAGE][:dealer_opening_hand],
                       dealer[0][:name]))
  prompt_with_newline(format(MESSAGES[LANGUAGE][:player_hand],
                             player[0][:name], player[1][:name]))
end

def display_play_again_prompt
  prompt_with_newline(MESSAGES[LANGUAGE][:again?])
end

def valid_yes_or_no?(response)
  MESSAGES[LANGUAGE][:yes].include?(response) ||
    MESSAGES[LANGUAGE][:no].include?(response)
end

def display_invalid_choice_msg
  prompt_with_newline(MESSAGES[LANGUAGE][:invalid_choice])
end

def yes?(response)
  MESSAGES[LANGUAGE][:yes].include?(response) ? true : false
end

def play_again?
  answer = ""
  loop do
    display_play_again_prompt
    answer = gets.chomp.downcase
    puts ""
    break if valid_yes_or_no?(answer)
    display_invalid_choice_msg
  end
  yes?(answer)
end

def display_player_bust
  prompt_with_newline(MESSAGES[LANGUAGE][:player_bust])
end

def display_dealer_bust
  prompt_with_newline(MESSAGES[LANGUAGE][:dealer_bust])
end

def display_player_win
  prompt_with_newline(MESSAGES[LANGUAGE][:player_win])
end

def display_dealer_win
  prompt_with_newline(MESSAGES[LANGUAGE][:dealer_win])
end

loop do
  clear_terminal
  welcome_player
  game_deck = initialize_deck
  player_hand = initialize_empty_hand
  dealer_hand = initialize_empty_hand
  deal_starting_hands!(game_deck, player_hand, dealer_hand)
  display_opening_hands(dealer_hand, player_hand)

  player_turn!(game_deck, player_hand)

  if busted?(player_hand)
    display_player_bust
    display_dealer_win
    again = play_again?
    break unless again
    next if again
  end

  display_dealer_hand(dealer_hand)
  dealer_turn!(game_deck, dealer_hand)

  if busted?(dealer_hand)
    display_dealer_bust
    display_player_win
    again = play_again?
    break unless again
    next if again
    break
  end

  winner = determine_winner(player_hand, dealer_hand)
  display_winner(winner)

  again = play_again?
  break unless again
  next if again
end

prompt_with_newline(MESSAGES[LANGUAGE][:goodbye])
