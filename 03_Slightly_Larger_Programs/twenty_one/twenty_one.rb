# twenty_one.rb
require 'yaml'

# ------------------------------- Constants --------------------------------- #

MESSAGES = YAML.load_file('twenty_one_messages.yaml')

SUITS = ['Hearts', 'Spades', 'Diamonds', 'Clubs']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9',
          '10', 'Jack', 'Queen', 'King', 'Ace']

TARGET_SCORE = 21
DEALER_STAY_AT = 17

# -------------------------------- Methods ---------------------------------- #

def prompt(msg)
  print "=> #{msg}"
end

def clear_screen
  system "clear"
end

def blank_line(n=1)
  n.times { puts }
end

def separator
  puts '-' * 15
end

def initialize_deck
  VALUES.product(SUITS).shuffle
end

def initial_deal(deck, hands)
  2.times do
    hands[:player] << deck.pop
    hands[:dealer] << deck.pop
  end
end

def joinand(arr, delimiter=', ', conjunction='and')
  case arr.size
  when 0 || 1 then arr.first.to_s
  when 2 then arr.join(" #{conjunction} ")
  else
    arr[-1] = "#{conjunction} #{arr.last}"
    arr.join(delimiter)
  end
end

def play_again?
  answer = ''
  loop do
    prompt MESSAGES['play_again']
    answer = gets.downcase.chomp
    break if /[yn]/ =~ answer
    prompt MESSAGES['y_or_n']
  end
  answer == 'y'
end

def detect_winner(hands)
  player_total = sum_of_cards(hands[:player])
  return 'dealer' if player_total > TARGET_SCORE
  dealer_total = sum_of_cards(hands[:dealer])
  return 'player' if dealer_total > TARGET_SCORE

  if player_total > dealer_total
    'player'
  elsif player_total < dealer_total
    'dealer'
  else
    'tie'
  end
end

def update_scoreboard(hand_winner, scoreboard)
  scoreboard[0] += 1 if hand_winner == 'player'
  scoreboard[1] += 1 if hand_winner == 'dealer'
end

# --------- Display Methods --------- #

def display_total(cards)
  print sum_of_cards(cards)
end

def display_hand(hand, who)
  prompt MESSAGES["#{who}_hand"]
  display_cards(hand)

  unless bust?(hand)
    prompt MESSAGES["#{who}_total"]
    display_total(hand)
  end
end

def display_cards(hand)
  cards = hand.map { |card| card.join(' of ') }
  puts joinand(cards)
end

def display_hand_winner(winner)
  sleep(1)
  prompt MESSAGES["#{winner}_wins"]
  sleep(3)
end

def display_scoreboard(scoreboard)
  clear_screen

  who = ['player', 'dealer']
  print MESSAGES['scoreboard'].rjust(23)

  2.times { |n| print MESSAGES["#{who[n]}_score"], scoreboard[n] }

  blank_line(5)
  unless scoreboard.any?(5)
    print MESSAGES['enter_for_next_hand']
    gets
  end
end

def display_game_winner(winner)
  prompt MESSAGES["#{winner}_wins_game"]
  sleep(1)
end

# --------- Player Methods --------- #

def player_turn(deck, hands)
  sequence_player_turn(hands)

  loop do
    blank_line(2)
    next_move = player_choice

    if next_move == 's'
      sequence_stay(hands[:player], 'player')
      break
    end

    hit(deck, hands[:player])
    sequence_hit(hands[:player], 'player')
    break if bust?(hands[:player])
  end
end

def player_choice
  loop do
    prompt MESSAGES['ask_hit_or_stay']
    player_choice = gets.chomp
    return player_choice if %w(h s).include?(player_choice)
    prompt MESSAGES['sorry']
  end
end

# --------- Dealer Methods --------- #

def dealer_turn(deck, hands)
  sequence_dealer_turn(hands)

  loop do
    if dealer_stay?(hands[:dealer])
      sequence_stay(hands[:dealer], 'dealer')
      break
    end

    hit(deck, hands[:dealer])
    sequence_hit(hands[:dealer], 'dealer')
    blank_line
    break if bust?(hands[:dealer])

    sleep(2)
    separator
  end
end

def dealer_stay?(hand)
  sum_of_cards(hand) >= DEALER_STAY_AT
end

# --------- Twenty-One Specific Methods --------- #

def hit(deck, hand)
  hand << deck.pop
end

def bust?(hand)
  sum_of_cards(hand) > TARGET_SCORE
end

# --------- Calculation Methods --------- #

def sum_of_cards(*cards)
  aces = cards.flatten!.select { |card| card == "Ace" }.size

  total = cards.select { |values| VALUES.include?(values) }.map do |value|
    value.to_i == 0 ? numeric_value(value) : value.to_i
  end.sum

  total > TARGET_SCORE && aces > 0 ? adjust_for_aces(total, aces) : total
end

def numeric_value(value)
  value == "Ace" ? 11 : 10
end

def adjust_for_aces(total, aces)
  while total > TARGET_SCORE && aces > 0
    total -= 10
    aces -= 1
  end
  total
end

# --------- Sequence Methods (for game flow) --------- #

def sequence_welcome
  clear_screen
  puts MESSAGES['welcome']
  sleep(0.75)

  puts MESSAGES['enter_begin']
  gets
end

def sequence_new_game
  clear_screen
  prompt MESSAGES['begin']
  sleep(1.5)
end

def sequence_deal
  clear_screen
  prompt MESSAGES['dealing']
  sleep(1.5)
  clear_screen
end

def sequence_shuffle
  clear_screen
  prompt MESSAGES['shuffling']
  sleep(0.75)
  (5..20).each do |n|
    clear_screen
    top_bottom = ('----').rjust(n)
    sides = (' |  |').rjust(n)

    puts top_bottom, sides, top_bottom
    sleep(0.1)
  end
end

def sequence_player_turn(hands)
  prompt MESSAGES['dealer_hand'] +
         hands[:dealer][0].join(' of ') + MESSAGES['unknown']

  blank_line(2)

  display_hand(hands[:player], 'player')
end

def sequence_dealer_turn(hands)
  sleep(1.25)
  clear_screen
  prompt MESSAGES['dealer_turn']
  sleep(1.5)
  clear_screen

  prompt MESSAGES['player_total']
  display_total(hands[:player])
  sleep(1)
  blank_line(2)
  display_hand(hands[:dealer], 'dealer')

  blank_line
  separator
  sleep(2)
end

def sequence_hit(hand, who)
  prompt MESSAGES["#{who}_hit"]
  sleep(1.25)

  prompt MESSAGES["#{who}_received"]
  puts hand[-1].join(' of ')
  sleep(1.25)

  separator
  display_hand(hand, "#{who}_updated")
end

def sequence_bust(hand, who)
  blank_line if who == 'player'

  prompt MESSAGES['bust']
  prompt MESSAGES["#{who}_bust"]
  display_total(hand)
  blank_line
  puts '=' * 15
end

def sequence_stay(hand, who)
  prompt "#{MESSAGES["#{who}_stay"]}#{sum_of_cards(hand)}\n"
end

def sequence_compare_cards(hands)
  sleep(2)
  clear_screen

  puts '=' * 15
  display_hand(hands[:player], 'player')
  puts "\n", ('-' * 6)
  display_hand(hands[:dealer], 'dealer')
  puts "\n", ('=' * 15)
end

# ---------------------------------- Main ----------------------------------- #
sequence_welcome

loop do
  scoreboard = [0, 0]
  hand_winner = ''
  sequence_shuffle

  loop do
    hands = { player: [], dealer: [] }
    deck = initialize_deck

    sequence_deal
    initial_deal(deck, hands)

    hands.each_key do |hand|
      hand == :player ? player_turn(deck, hands) : dealer_turn(deck, hands)

      if bust?(hands[hand])
        sequence_bust(hands[hand], hand.to_s)
        break
      elsif hand == :dealer
        sequence_compare_cards(hands)
      end
    end

    hand_winner = detect_winner(hands)
    display_hand_winner(hand_winner)
    update_scoreboard(hand_winner, scoreboard) unless hand_winner == 'tie'
    display_scoreboard(scoreboard)

    break if scoreboard.any?(5)
  end

  display_game_winner(hand_winner)
  play_again? ? next : break
end

# notes/improvements:
#   - did not adjust for caching the 'total' variable since my program
#     is a little bit different than the 'possible solution'
#   - does not account for being dealt 21.. aka 'Blackjack'
#   - game could also auto-stay when 21 is reached
#   - the numerous 'sequence methods' are mainly for the user experience
