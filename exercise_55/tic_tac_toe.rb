require 'colorize'
class Board
    attr_accessor :array, :winner
    attr_reader :players
    def initialize
        @array = ["1","2","3","4","5","6","7","8","9"]
        @players = ["X".red,"O".blue]
        @winner = winner
    end

    def won?
        @players.each do |player|
            if @array[0,3].all? player
                @winner = player
                return true
            elsif @array[3,3].all? player
                @winner = player
                return true
            elsif @array[6,3].all? player
                @winner = player
                return true
            elsif @array[0]+@array[3]+@array[6] == (player+player+player).to_s
                @winner = player
                return true
            elsif @array[1]+@array[4]+@array[7] == (player+player+player).to_s
                @winner = player
                return true
            elsif @array[2]+@array[5]+@array[8] == (player+player+player).to_s
                @winner = player
                return true
            elsif @array[0]+@array[4]+@array[8] == (player+player+player).to_s
                @winner = player
                return true
            elsif @array[2]+@array[4]+@array[6] == (player+player+player).to_s
                @winner = player
                return true
            end
        end
        return false
    end
    def print_board
            puts "   -----------------------".yellow
            print "    #{array[0,3].join("    |    ".yellow)}"
            puts
            puts "   -----------------------".yellow
            print "    #{array[3,3].join("    |    ".yellow)}"
            puts
            puts "   -----------------------".yellow
            print "    #{array[6,3].join("    |    ".yellow)}"
            puts
            puts "   -----------------------".yellow
    end
    def empty?(pos)
        !@players.include? @array[pos-1]
    end

    def mark_place(pos, player)
        @array[pos-1] = player  
    end
end

def reset_screen
    clear_screen
    move_to_home
end
  
  # Clears the content on the terminal.
def clear_screen
    print "\e[2J"
end
  
  # Moves the insert point in the terminal to the upper left.
def move_to_home
    print "\e[H"
end

board = Board.new
4.times do
    reset_screen
    puts board.print_board
    board.players.each do |player|
        puts player + " player,Input your number".yellow
        pos=gets.chomp.to_i 
        if !board.empty?(pos)
            loop do
                puts "Position is TAKEN!".yellow
                puts player + " player,Input your number again".yellow
                pos=gets.chomp.to_i
                break if board.empty?(pos)
            end
            board.mark_place(pos,player)
        else
            board.mark_place(pos,player)
        end
        reset_screen
        puts board.print_board
        board.won?
        break if board.won? == true
    end
    break if board.won? == true
end

if board.won?
    
    puts board.winner + " IS WINNER!".green
else
    puts "DRAW!".orange
end