class HumanPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        pos = nil
        until legal_positions.include?(pos)
            puts "Player #{@mark.to_s}, enter position in format 'row, column' "
            pos = gets.chomp.split(" ").map(&:to_i)
            raise "This position is illegal; Choose from the available positions" if !legal_positions.include?(pos)
            raise "Enter the position in specified format" if pos.length > 2
        end
        return pos
    end
end