require 'byebug'

class Player
    attr_reader :name
    def initialize(name)
        @name = name
    end
end

class HumanPlayer < Player

    def move(game, marker)
        puts "enter your input" 
        #input will be e.g. "1,1"
        input = gets.chomp
        row = input.split(",")[0].to_i
        column = input.split(",")[1].to_i
        return [row, column]
    end


end

class ComputerPlayer < Player
    def move(game, marker)
        # if able to win, return winning position
        # if not, do random move
        # return random move position
        winning_move(game, marker) || random_move(game, marker)
    end

    def winning_move(game, marker)
        # Write a winning move that uses place_marker 
        # directly without cloning

        range = (0..2).to_a
        range.each do |each_row|
            range.each do |each_col|
                position = [each_row, each_col]
                if game.board.empty?(position)
                    game.board.place_marker(position, marker)
                    if game.board.winner == marker
                        game.board.place_marker(position, nil)
                        return position
                    else
                        game.board.place_marker(position, nil)
                    end
                end
            end
            end
        end
        return nil
    end

    def random_move(game, marker)
        range = (0..2).to_a
        position = [range.sample, range.sample]

        return position
    end
end

class Board

    attr_reader :grid

    def initialize(grid = [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]])
        @grid = grid 
    end

    def get_marker(position)
        # getter
        # position = e.g. [r,c]
        self.grid[position[0]][position[1]]
    end

    def empty?(position)
        # [0,1]
        self.get_marker(position).nil?
    end

    def full?
        self.grid.each do |each_row|
            each_row.each do |each_element|
                if each_element.nil?
                    return false
                end
            end
        end
        return true

        # @grid.all? { |row| row.none? { |element| element.nil? } }
    end

    def place_marker(position, marker)
        #setter
        #position = e.g. [0,0]
        # position[0] = 0
        #position[1] = 0
        #marker = "X" / "O"

        if marker.nil? || empty?(position)
            # @grid[0][0]
            self.grid[position[0]][position[1]] = marker
        else
            raise "already has a marker at this position"

        end
    end

    def to_s
        self.grid.each do |each_row|
            print "| "
            each_row.each do |each_element|
                print each_element.to_s + " | "
            end
            puts
            puts "-" * 11
        end
    end

    def game_over?
        won? || full?
    end

    def won?
        !winner.nil?
    end

    def winner
        # grid is already rows
        (self.grid + columns + diagonals).each do |threes|
            if threes == ["X", "X", "X"]
                return "X"
            end
            if threes == ["O", "O", "O"]
                return "O"
            end
        end
        return nil
    end

    def columns
        # @grid = [
        #     [nil, nil, nil],
        #     [nil, nil, nil],
        #     [nil, nil, nil]
        # ]
        cols = [[],[],[]]
        @grid.each do |each_row|
            each_row.each_with_index do |marker, index|
                cols[index] << marker
            end
        end
        return cols

        # return [
        #     [@grid[0][0],@grid[1][0], @grid[2][0]],
        #     [@grid[0][1],@grid[1][1], @grid[2][1]],
        #     [@grid[0][2],@grid[1][2], @grid[2][2]]
        # ]
    end

    def diagonals

        # return [
        #         [@grid[0][0],@grid[1][1], @grid[2][2]],
        #         [@grid[0][2],@grid[1][1], @grid[2][0]]
        #     ]


        # @grid = [
        #     ["x", nil, nil],
        #     [nil, nil, nil],
        #     [nil, nil, nil]
        # ]
        # @grid[0][0]

        first_diag = [[0,0],[1,1],[2,2]]
        second_diag =[[0,2],[1,1],[2,0]]

        # diag = []

        # [first_diag, second_diag].each do |each_diag|
        #     temp_diag = []
        #     each_diag.each do |each_position|
        #         # each_position = [0,0]
        #         temp_diag << self.grid[each_position[0]][each_position[1]]
        #     end
        #     diag << temp_diag
        # end

        [first_diag, second_diag].map do |each_diag|
            each_diag.map { |row, col| self.grid[row][col] }
        end

    end

    def clone_board
        new_grid = []
        self.grid.each do |each_row|
            new_grid << each_row.dup
        end
        return self.class.new(new_grid)
    end

end

class Game
    attr_reader :players, :board
    attr_accessor :turn
    def initialize(player1, player2)
        @board = Board.new
        @players = { "X" => player1, "O" => player2 }
        @turn = "X"
    end

    def play_game
        until self.board.game_over?

            # byebug

            self.show

            #asking for input and sending it
            loop do
                # self is the instance of the Game
                current_player = self.players[self.turn]
                position = current_player.move(self, self.turn)

                if self.board.empty?(position)
                    self.board.place_marker(position, self.turn)

                    # check if someone has won
                    if self.board.won?
                        winner = self.players[self.turn]
                        puts "#{winner.name} has won!"
                        self.show
                        break
                    end

                    # check if someone
                    if self.board.full?
                        puts "It's a draw!"
                        self.show
                        break
                    end

                    # self.show

                    #move to the next player
                    self.switch_player

                    break
                end
            end

        end


    end

    def switch_player
        if self.turn == "X"
            self.turn = "O"
        else
            self.turn = "X"
        end
    end

    def show
        puts self.board
    end
end

human = HumanPlayer.new("Joel")
computer = ComputerPlayer.new("Computer")

Game.new(human, computer).play_game