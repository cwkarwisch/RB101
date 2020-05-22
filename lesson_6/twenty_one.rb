UPPER_LIMIT = 21
DEALER_STAYS = 17
PLAY_TO = 5

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
    player_hand: "You have: %s and %s, for a total of %s.",
    player_bust: "You busted...",
    dealer_bust: "The dealer busted...",
    hit_or_stay?: "Would you like to hit or stay?",
    instructions: "Enter 'hit' (or just 'h') or 'stay' (or just 's').",
    player_draw: "You drew a %s.",
    dealer_draw: "Dealer drew a %s...",
    player_hand_value: "Your cards now add up to %s.",
    dealer_hand_value: "The Dealer's cards now add up to %s.",
    final_hand_values: "The player's final cards added up to %s and the \
dealer's cards added up to %s.",
    invalid_choice: "Sorry that's not a valid choice.",
    dealer_shows_hand: "The Dealer flips over its second card: \
Dealer has %s and %s, for a total of %s.",
    player_final_cards: "The player had %s.",
    dealer_final_cards: "The dealer had %s.",
    player_win: "You win!",
    dealer_win: "The dealer won. Better luck next time!",
    tie: "It's a tie!",
    score: "The score is now
   Player: %i
   Dealer: %i",
    again?: "Would you like to play again? ('y' or 'n')",
    goodbye: "Thank you for playing. Goodbye!",
    yes: ["yes", "y"],
    no: ["no", 'n'],
    hit: ["hit", "h"],
    stay: ['stay', 's'],
    delimiter: ", ",
    separating_word: "and"
  }
}

LANGUAGE = :en

def clear_terminal
  system('clear') || system('cls')
end

def prompt(message)
  puts "=> #{message}"
end

def prompt_with_newline(message)
  puts "=> #{message}"
  puts " "
end

def initialize_deck
  (QUARTER_DECK * 4).shuffle
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
  hand << deck.pop
end

def any_ace_in_hand?(hand)
  hand.any? { |card| card[:name] == "Ace" }
end

def number_of_aces_in_hand(hand)
  hand.select { |card| card[:name] == 'Ace' }.size
end

def calculate_value_of_hand(hand)
  value = hand.reduce(0) { |hand_value, card| hand_value + card[:value] }
  if any_ace_in_hand?(hand)
    number_of_aces = number_of_aces_in_hand(hand)
    number_of_aces.times do
      break if value <= UPPER_LIMIT
      value -= 10
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

def display_player_hand_value(hand_value)
  prompt_with_newline(format(MESSAGES[LANGUAGE][:player_hand_value],
                             hand_value.last.to_s))
end

def player_hit!(deck, hand, hand_value)
  deal_card!(deck, hand)
  display_last_player_card_drawn(hand)
  update_hand_value!(hand, hand_value)
  display_player_hand_value(hand_value)
end

def player_turn!(deck, hand, hand_value)
  answer = nil
  loop do
    display_hit_or_stay
    answer = gets.chomp.downcase
    puts ""
    if hit?(answer)
      player_hit!(deck, hand, hand_value)
      break if busted?(hand_value)
      next
    end
    break if stay?(answer)
    display_invalid_choice_msg
  end
end

def busted?(hand_value)
  hand_value.last > UPPER_LIMIT
end

def dealer_turn!(deck, hand, hand_value)
  loop do
    break if dealer_stay?(hand_value)
    deal_card!(deck, hand)
    display_last_dealer_card_drawn(hand)
    update_hand_value!(hand, hand_value)
    display_dealer_current_value(hand_value)
  end
end

def update_hand_value!(hand, hand_value)
  hand_value << calculate_value_of_hand(hand)
end

def display_dealer_current_value(hand_value)
  prompt_with_newline(format(MESSAGES[LANGUAGE][:dealer_hand_value],
                             hand_value.last))
end

def display_dealer_hand(hand, hand_value)
  prompt_with_newline(format(MESSAGES[LANGUAGE][:dealer_shows_hand],
                             hand[0][:name], hand[1][:name], hand_value.last))
end

def dealer_stay?(hand_value)
  hand_value.last >= DEALER_STAYS
end

def determine_winner(player_hand_value, dealer_hand_value)
  if player_hand_value.last > dealer_hand_value.last
    "player"
  elsif dealer_hand_value.last > player_hand_value.last
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
end

def display_dealing_cards
  prompt_with_newline(MESSAGES[LANGUAGE][:dealing])
end

def display_opening_hands(dealer, player, player_value)
  puts "=> " + (format(MESSAGES[LANGUAGE][:dealer_opening_hand],
                       dealer[0][:name]))
  prompt_with_newline(format(MESSAGES[LANGUAGE][:player_hand],
                             player[0][:name], player[1][:name],
                             player_value.last))
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

def update_score!(score, winner)
  score[winner] += 1
end

def display_score(score)
  prompt_with_newline(format(MESSAGES[LANGUAGE][:score],
                             score["player"], score["dealer"]))
end

def grand_winner?(score)
  score.any? { |_, wins| wins == PLAY_TO }
end

def initialize_empty_total
  []
end

def display_results(player_hand, player_total, dealer_hand, dealer_total)
  display_final_hands(player_hand, dealer_hand)
  display_final_hand_values(player_total, dealer_total)
end

def display_final_hands(player_hand, dealer_hand)
  prompt(format(MESSAGES[LANGUAGE][:player_final_cards],
                joinor(player_hand, MESSAGES[LANGUAGE][:delimiter],
                       MESSAGES[LANGUAGE][:separating_word])))
  prompt_with_newline(format(MESSAGES[LANGUAGE][:dealer_final_cards],
                             joinor(dealer_hand,
                                    MESSAGES[LANGUAGE][:delimiter],
                                    MESSAGES[LANGUAGE][:separating_word])))
end

def display_final_hand_values(player_total, dealer_total)
  prompt_with_newline(format(MESSAGES[LANGUAGE][:final_hand_values],
                             player_total.last, dealer_total.last))
end

def joinor(cards, delimiter, separating_word)
  string = ''
  counter = 0
  size = cards.length
  return join_two_words(cards, separating_word) if size == 2
  loop do
    break if counter == size
    string << cards[counter][:name]
    string << delimiter unless counter == (size - 1)
    string << separating_word << " " if counter == (size - 2)
    counter += 1
  end
  string
end

def join_two_words(cards, separating_word)
  "#{cards[0][:name]} #{separating_word} #{cards[1][:name]}"
end

score = {
  "player" => 0,
  "dealer" => 0
}

clear_terminal
welcome_player

loop do
  game_deck = initialize_deck
  player_hand = initialize_empty_hand
  dealer_hand = initialize_empty_hand
  deal_starting_hands!(game_deck, player_hand, dealer_hand)
  display_dealing_cards
  player_total = initialize_empty_total
  dealer_total = initialize_empty_total
  player_total << calculate_value_of_hand(player_hand)
  dealer_total << calculate_value_of_hand(dealer_hand)
  display_opening_hands(dealer_hand, player_hand, player_total)

  player_turn!(game_deck, player_hand, player_total)

  if busted?(player_total)
    display_player_bust
    update_score!(score, "dealer")
    display_results(player_hand, player_total, dealer_hand, dealer_total)
    display_dealer_win
    display_score(score)
    break if grand_winner?(score)
    again = play_again?
    break unless again
    clear_terminal
    next if again
  end

  display_dealer_hand(dealer_hand, dealer_total)
  dealer_turn!(game_deck, dealer_hand, dealer_total)

  if busted?(dealer_total)
    update_score!(score, "player")
    display_dealer_bust
    display_results(player_hand, player_total, dealer_hand, dealer_total)
    display_player_win
    display_score(score)
    break if grand_winner?(score)
    again = play_again?
    break unless again
    clear_terminal
    next if again
    break
  end

  winner = determine_winner(player_total, dealer_total)
  display_results(player_hand, player_total, dealer_hand, dealer_total)
  display_winner(winner)
  update_score!(score, winner) unless winner == 'tie'
  display_score(score)
  break if grand_winner?(score)

  again = play_again?
  break unless again
  clear_terminal
  next if again
end

prompt_with_newline(MESSAGES[LANGUAGE][:goodbye])
