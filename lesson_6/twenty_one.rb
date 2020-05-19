QUARTER_DECK = [
  {2 => "2"},
  {3 => "3"},
  {4 => "4"},
  {5 => "5"},
  {6 => "6"},
  {7 => "7"},
  {8 => "8"},
  {9 => "9"},
  {10 => "10"},
  {10 => "Jack"},
  {10 => "Queen"},
  {10 => "King"},
  {11 => "Ace"}
]

def clear_terminal
  system('clear') || system('cls')
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

def calculate_value_of_hand(hand)
  hand.reduce(0) { |hand_value, card_value| hand_value + card_value.keys[0] }
end

def player_turn(deck, hand)
  answer = nil
  loop do
    puts "=> Hit or stay?"
    answer = gets.chomp.downcase
    deal_card!(deck, hand) if answer == 'hit'
    puts "You drew a #{hand.last.values[0]}" if answer == 'hit'
    puts "Sorry that's not a valid choice" unless answer == 'hit' || answer == 'stay'
    break if answer == 'stay' || busted?(hand)
  end
end

def busted?(hand)
  calculate_value_of_hand(hand) > 21
end

def dealer_turn(deck, hand)
  loop do
    break if dealer_stay?(hand)
    deal_card!(deck, hand)
  end
end

def dealer_stay?(hand)
  calculate_value_of_hand(hand) >= 17
end

def determine_winner(player, dealer)
  player_score = calculate_value_of_hand(player)
  dealer_score = calculate_value_of_hand(dealer)
  case
  when player_score > dealer_score then "player"
  when dealer_score > player_score then "dealer"
  when player_score == dealer_score then "tie"
  end
end

def display_winner(winner)
  puts "You win!" if winner == 'player'
  puts "Dealer wins!" if winner == 'dealer'
  puts "It's a tie!" if winner == 'tie'
end


loop do
  clear_terminal
  puts "=> Welcome to Twenty-One!"
  puts ""
  puts "=> Dealing cards...."
  puts ""
  game_deck = initialize_deck
  player_hand = initialize_empty_hand
  dealer_hand = initialize_empty_hand
  deal_starting_hands!(game_deck, player_hand, dealer_hand)

  puts "=> Dealer has: #{dealer_hand[0].values[0]} and unknown card"
  puts "=> You have: #{player_hand[0].values[0]} and #{player_hand[1].values[0]}"
  puts ""
  # p player_hand
  # score = calculate_value_of_hand(player_hand)
  # p score
  player_turn(game_deck, player_hand)
  if busted?(player_hand)
    puts "You busted..."
    break
  end
  dealer_turn(game_deck, dealer_hand)
  winner = determine_winner(player_hand, dealer_hand)
  display_winner(winner)
  p "player hand: #{player_hand}"
  p "dealer hand: #{dealer_hand}"
  puts "=> Would you like to play again?"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

