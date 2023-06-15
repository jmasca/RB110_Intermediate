require 'yaml'
MESSAGES = YAML.load_file('ttt_messages.yaml')

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                 [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                 [1, 5, 9], [3, 5, 7]]            # diagonals

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINS_FOR_VICTORY = 5

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd, scores={})
  display_score(scores) unless scores.empty?
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

def victory?(scores)
  scores.value?(WINS_FOR_VICTORY)
end

def display_game_result(brd, scores, result)
  display_board(brd, scores)
  prompt MESSAGES[result]
  sleep(1)
  enter_to_continue
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

def welcome_sequence
  display_welcome_message
  sleep(0.75)
  users_choice = welcome_options
  view_instructions if users_choice == '2'
end

def display_welcome_message
  system "clear"
  sleep(0.5)
  puts "=> #{MESSAGES['welcome']}".center(80), "\n\n"
end

def welcome_options
  puts MESSAGES['welcome_options'].to_s.center(80)
  loop do
    choice = gets.chomp
    return choice if %w(1 2).include?(choice)
    prompt MESSAGES['one_or_two']
  end
end

def enter_to_continue
  puts "\nPress Enter to continue..."
  gets.chomp
end

def view_instructions
  display_guide_board
  sleep(0.75)
  display_rules((1..3))
  enter_to_continue
  system "clear"
  display_guide_board
  sleep(0.75)
  system "clear"
  display_guide_board(true)
  sleep(0.75)
  display_rules((4..7))
  enter_to_continue
end

def display_guide_board(example=false)
  system "clear"
  guide_board = {}
  (1..9).each do |num|
    guide_board[num] = if example && num == 5
                         PLAYER_MARKER
                       else
                         num
                       end
  end
  display_board(guide_board)
end

def display_rules(rules_lines)
  rules = 'rules_0'
  rules_lines.each do |n|
    rules[-1] = n.to_s
    puts MESSAGES[rules]
    sleep(1.25)
  end
end

def who_goes_first
  system "clear"
  puts "=> #{MESSAGES['who_goes_first']}".center(80), "\n"
  sleep(0.75)
  puts MESSAGES['whos_first_options'].to_s.center(80)
  users_choice
end

def users_choice
  loop do
    first = gets.chomp
    case first
    when '1' then return 'player'
    when '2' then return 'computer'
    when '3' then return %w(player computer).sample
    end
    prompt MESSAGES['one_two_three']
  end
end

def whos_first_every_round?
  display_choose_every_round_options
  choice = ''
  loop do
    choice = gets.chomp
    break if %w(1 2).include?(choice)
    prompt MESSAGES['one_or_two']
  end
  choice == '1'
end

def display_choose_every_round_options
  puts "\n", "=> #{MESSAGES['every_round?']}".center(80), "\n"
  sleep(0.5)
  puts MESSAGES['choose_1'].to_s.center(80), "\n"
  puts MESSAGES['choose_2'].to_s.center(80), "\n"
end

def intro(player, scores)
  system "clear"
  sleep(0.50)
  whos_x_and_o if scores.values.all?(0)
  puts "#{player.upcase}#{MESSAGES['up_first']}".center(80)
  sleep(1.75)
end

def whos_x_and_o
  puts MESSAGES['x_and_o'].to_s.center(80), "\n"
  sleep(1.11)
end

def winning_sequence(winner)
  winner == 'player' ? player_wins : computer_wins
  sleep(1.85)
  puts "\n\n\n"
end

def player_wins
  4.times do
    system "clear"
    sleep(0.36)
    puts "=> CONGRATULATIONS!!! <=".center(80)
    sleep(0.36)
  end
  sleep(0.25)
  puts "\n", MESSAGES['player_wins'].to_s.center(80)
end

def computer_wins
  system "clear"
  puts MESSAGES['computer_wins'].to_s.center(80)
end

# ---------------------------------- main ----------------------------------- #
welcome_sequence
loop do
  scores = { 'player' => 0, 'computer' => 0 }
  starting_player = who_goes_first
  always_choose = whos_first_every_round?
  game_result = ''

  loop do
    intro(starting_player, scores)
    board = initialize_board
    current_player = starting_player

    loop do
      display_board(board, scores)
      sleep(1) unless board.values.all?(" ") && current_player == 'player'
      place_marker!(board, current_player)
      break if someone_won?(board) || board_full?(board)
      current_player = alternate_player(current_player)
    end

    game_result = winner_or_tie(board)
    update_score!(scores, game_result)
    display_game_result(board, scores, game_result)

    break if victory?(scores)
    starting_player = if always_choose then who_goes_first
                      else alternate_player(starting_player) end
  end

  winning_sequence(game_result)
  break unless play_again?
end

prompt MESSAGES['bye']
