require 'yaml'
MESSAGES = YAML.load_file('ttt_messages.yaml')

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                 [1, 5, 9], [3, 5, 7]]            # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_welcome_message
  system "clear"
  puts "=> #{MESSAGES['welcome']}".center(80)
end

# def display_guide_board
#   guide_board = {}
#   (1..9).each { |num| guide_board[num] = num }
#   display_board(guide_board)
# end

def display_board(brd, scores)
  display_score(scores)
  # puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.\n\n\n"
  brd_arr = ["",                                            # 0
             "     |     |     ",                           # 1
             "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  ",   # 2
             "-----+-----+-----",                           # 3
             "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  ",   # 4
             "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  ",   # 5
             "\n\n"]                                        # 6

  index_order = [0, 1, 2, 1, 3, 1, 4, 1, 3, 1, 5, 1, 6]
  index_order.each { |n| puts brd_arr[n].center(42) }
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_marker!(brd)
  square = ''
  loop do
    prompt "#{MESSAGES['choose_square']} #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt MESSAGES['invalid_choice']
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_marker!(brd)
  square = offense(brd, square)
  square = defense(brd, square) if !square

  if !square && brd[5] == INITIAL_MARKER
    square = 5
  elsif !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'computer'
    end
  end
  nil
end

def joinor(arr, delimiter=', ', conjunction='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{conjunction} ")
  else
    arr[-1] = "#{conjunction} #{arr.last}"
    arr.join(delimiter)
  end
end

def winner_or_tie(brd)
  someone_won?(brd) ? detect_winner(brd) : 'tie'
end

def update_score!(scores, winner)
  scores[winner] += 1 unless winner == 'tie'
end

def display_score(scores)
  system "clear"
  puts "Current Score".center(42)
  puts "   Player: #{scores['player']}  |\
  Computer: #{scores['computer']}\n\n".center(42)
end

def play_again?
  answer = ''
  loop do
    prompt MESSAGES['again']
    answer = gets.downcase.chomp
    break if /[yn]/ =~ answer
    prompt MESSAGES['y_or_n']
  end
  answer == 'y'
end

def end_of_round_pause
  puts "\nPress Enter to continue..."
  gets.chomp
end

def victory?(scores)
  scores.value?(5)
end

def display_game_result(brd, scores, result)
  display_board(brd, scores)
  prompt MESSAGES[result]
  end_of_round_pause
end

def place_marker!(brd, current_player)
  if current_player == 'player'
    player_places_marker!(brd)
  else
    computer_places_marker!(brd)
  end
end

def alternate_player(current_player)
  return 'player' if current_player == 'computer'
  'computer'
end

def offense(brd, sqr)
  WINNING_LINES.each do |line|
    sqr = find_risk_or_win(line, brd, COMPUTER_MARKER)
    return sqr if sqr
  end
  nil
end

def defense(brd, sqr)
  WINNING_LINES.each do |line|
    sqr = find_risk_or_win(line, brd, PLAYER_MARKER)
    return sqr if sqr
  end
  nil
end

def find_risk_or_win(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

# def winner_sequence(winner)
#   system "clear"
# end

# def view_quick_guide
#   display_guide_board
# end

# ---------------------------------- main ----------------------------------- #
# welcome_sequence
loop do
  scores = { 'player' => 0, 'computer' => 0 }

  loop do
    # current_player = who_goes_first
    current_player = 'player'
    board = initialize_board

    loop do
      display_board(board, scores)
      sleep(1) unless board.values.all?(" ")
      place_marker!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    game_result = winner_or_tie(board)

    update_score!(scores, game_result)
    display_game_result(board, scores, game_result)

    break if victory?(scores)
    # current_player = %w(player computer).sample
  end

  # winner_sequence
  break unless play_again?
end

prompt MESSAGES['bye']
