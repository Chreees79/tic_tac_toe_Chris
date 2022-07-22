class Board
  attr_accessor :boardcases

  def initialize
    create_boardcases
  end

  def create_boardcases
    @boardcases = []
    9.times do |i|
      boardcase = Boardcase.new("·")
      @boardcases << boardcase
    end
  end

   def show
  puts
  puts
  line = " " * 25 + " " + "-" * 41
  empty_field_line = "|" + " ".rjust(13," ")
  empty_field = " " * 6
    puts  " " * 25 + " " + "=" * 6 + "A".colorize(:black).colorize(:background => :yellow) + "=" * 13 + "B".colorize(:black).colorize(:background => :yellow) + "=" * 13 + "C".colorize(:black).colorize(:background => :yellow) +"=" * 6
    puts  " " * 25 + empty_field_line * 3 + "|"
    puts " " * 25 + "1".colorize(:black).colorize(:background => :magenta) + empty_field + self.boardcases[0].value + " " * 6 + "|" + empty_field + self.boardcases[3].value + " " * 6+ "|" + empty_field + self.boardcases[6].value + " " * 6 + "|"
    puts  " " * 25 + empty_field_line * 3 + "|"
    puts line
    puts " " * 25 +  empty_field_line * 3 + "|"
    puts " " * 25 + "2".colorize(:black).colorize(:background => :magenta) + empty_field + self.boardcases[1].value + " " * 6 + "|" + empty_field + self.boardcases[4].value + " " * 6 + "|" + empty_field + self.boardcases[7].value + " " * 6 + "|"
    puts  " " * 25 + empty_field_line * 3 + "|"
    puts line
    puts  " " * 25 + empty_field_line * 3 + "|"
    puts " " * 25 + "3".colorize(:black).colorize(:background => :magenta) + empty_field + self.boardcases[2].value + " " * 6 + "|" + empty_field + self.boardcases[5].value + " " * 6+ "|" + empty_field + self.boardcases[8].value + " " * 6 + "|"
    puts  " " * 25 + empty_field_line * 3 + "|"
    puts  " " * 25 + "=" * 41
    puts
    puts
  end

  def ex_aequo?
    number_case = 9
    @boardcases.each do |boardcase|
      if boardcase.value == "X" || boardcase.value == "O"
        number_case -= 1
      end
    end
      if number_case == 0
        return true
      else
        return false
      end
  end


  def win?
    win_lists = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    win_lists.each do |array|
      win_proof = self.boardcases[array[0]].value + self.boardcases[array[1]].value + self.boardcases[array[2]].value
      if win_proof == "XXX" || win_proof == "OOO"
        return true
      end
    end
    return false
  end
end
