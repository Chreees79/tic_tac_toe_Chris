class Player
  attr_accessor :name, :symbol, :victory_counter ## :pawn_type = X or O

  def initialize(name, symbol)
    @name = name.to_s
    @symbol = symbol.to_s
    @victory_counter = 0
  end

end

=begin class Player
  attr_reader :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol.to_s
  end

  def player_move
    case_localisation = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    puts "#{@name}, where would you like to play?"
    location = gets.chomp until case_localisation.include?(location)
    location.to_s.upcase
    if valid_input_check(location) == true
      @board.boardcase_content[case_localisation.index(location)].value = current_player
  end
end

  def valid_input_check(location)
    case_localisation = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    if (case_localisation.include? location) && (@board.boardcase_content[case_localisation.index(location)].value == "·")
      puts "très bon choix"
      return true
    else
      puts  "#{location} est un choix non valide, recommence."
      player_move
      return false
    end
  end

  def player_win?(board)
    board.row_win?(symbol) || board.column_win?(symbol) || board.diagonal_win?(symbol)
  end

  def congratulate_winner
    puts "Congrats #{@name}, you win!"
  end

end
=end