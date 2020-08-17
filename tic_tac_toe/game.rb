require "./board.rb"
require "./human_player.rb"
require "./computer_player.rb"

class Game
    def initialize(n, players)
        @players = players.map do |mark, is_computer|
            is_computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
        end
        @board = Board.new(n)
        @current_player = @players.first
    end

    def switch_turn
        @players.rotate!
        @current_player = @players.first
        return @current_player
    end

    def play
        while @board.empty_positions?
            @board.print
            choices = @board.legal_positions
            pos = @current_player.get_position(choices)
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "GAME OVER!"
                @board.print
                puts "PLAYER #{@current_player.mark} WON!"
                return
            else
                switch_turn
            end
        end
        @board.print
        puts "GAME OVER"
        puts "DRAW"
    end
end