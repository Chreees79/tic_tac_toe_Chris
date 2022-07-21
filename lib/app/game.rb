class Game
  attr_accessor :players , :board, :boardcases

  def initialize
    x_color = "X".red
    o_color = "O".yellow
    player1 = Player.new(nil, "X")
    player2 = Player.new(nil, "O")
    @players = [player1, player2]
    @board = Board.new
    @turn = 0
    @case_empty = 9
  end

  def define_players_names
    puts
    puts " " * 30 + "Tu es le premier joueur 👍, quel est tom nom ?".underline.black.on_yellow
    print " " * 35 + "↪️  "
    name1 = gets.chomp.to_s.blue
    @players[0].name = name1
    puts "Tu prendra les X.".underline.black.on_blue
    puts " " * 30 + "Appuyer sur entrée ⬅️  pour continuer...".yellow
    puts " " * 35 + "↪️  "
    gets
    puts
    puts " " * 30 + "Tu es le deuxième joueur et donc adversaire.... quel est tom nom ?".underline.black.on_yellow
    print " " * 35 + "↪️  "
    name2 = gets.chomp.to_s.green
    @players[1].name = name2
   puts" saches que tu prendra les O.".underline.black.on_blue
   puts " " * 30 + "Appuyer sur entrée ⬅️  pour continuer...".yellow
   puts " " * 35 + "↪️  "
   gets
    system 'clear'
  end

  def current_player_plays
    positions = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    current_player = @players[@turn%2]
    puts  " " * 25 + "C'est à #{current_player.name} de jouer."
    puts  " " * 25 + "Quelle case veux-tu jouer ?"
    print  " " * 30 + "↪️  "
    input = gets.chomp.to_s.upcase
    if valid_input_check(input) == true
      @board.boardcases[positions.index(input)].value = current_player.symbol
  end
end

  def valid_input_check(input)
    positions = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    if (positions.include? input) && (@board.boardcases[positions.index(input)].value == "·")
      return true
    else
      puts  " " * 30 + "#{input} est un choix non valide, recommence.".red
      current_player_plays
      return false
    end
  end

  def play_again?
    puts
    puts
    puts " " * 30 + "Voulez-vous refaire une partie?   🎮   [Y/N]".underline.black.on_yellow
    answer = gets.chomp.downcase
    puts " " * 35 + "↪️  "
    if answer == 'y'
      system 'clear'
      Game.new.perform
    elsif answer == 'n'
      puts " " * 30 + "Au revoir !".yellow
      exit 1
    else 
      self.play_again?
    end
  end

  def introduction
    puts "
    
          8888ba.88ba                              oo                   
          88  `8b  `8b                                                  
          88   88   88 .d8888b. 88d888b.  88d888b. dP .d8888b. 88d888b. ".yellow
    sleep 1
    puts "        88   88   88 88'  `88 88'  `88  88'  `88 88 88'  `88 88'  `88 
      88   88   88 88.  .88 88        88.  .88 88 88.  .88 88    88 "
    sleep 1
    puts "    dP   dP   dP `88888P' dP        88Y888P' dP `88888P' dP    dP 
    ooooooooooooooooooooooooooooooo~88~ooooooooooooooooooooooooooo
                                 dP                            
    ".yellow
  end

  def welcome
    puts " " * 30 + "Bienvenue sur le jeu mortel de Morpion".blue
    puts  " " * 30 + "Le but du jeu est d'être le dernier joueur à aligner 3 symboles".blue
    puts  " " * 30 + "dans une ligne, une colonne ou une diagonale".blue
    puts " " * 30 + "Appuyer sur entrée ⬅️  pour continuer...".yellow
    puts " " * 35 + "↪️ "
    gets
    puts " " * 30 +  "Le jeu se joue contre un ami".blue
    puts  " " * 30 + "Chaque joueur joue un tour".blue
    puts " " * 30 + "Appuyer sur entrée ⬅️  pour continuer...".yellow
    puts " " * 35 + "↪️ "
    gets
    puts  " " * 30 + "pour choisir une case, utilise les coordonnées inscrites".blue
    puts  " " * 30 + "au bord du tableau, et inscrit les dans le prompt (par ex: A1)".blue
    puts  " " * 30 + "Dernière chose...... ECLATEZ-VOUS !".green
    puts " " * 30 + "Appuyer sur entrée ⬅️  pour continuer...".yellow
    puts " " * 35 + "↪️ "
    gets
    system("clear")
  end

  def state_of_the_game
    puts
    puts  " " * 25 + "il reste #{@case_empty} cases libres".yellow
  end

  def perform  
    introduction
    welcome
    define_players_names
    while @turn < 9

      @turn += 1
      @board.show
      state_of_the_game
      current_player_plays
      @case_empty -= 1
      system 'clear'

        if @board.win? == true
          @board.show
          puts
          puts " " * 30 + "#{@players[@turn%2].name} a gagné !!!".yellow
          play_again?
        end
    end
    puts
    puts " " * 30 + "vous êtes à égalité !!!".green
    sleep 1
    system 'clear'
    play_again?
  end
end

