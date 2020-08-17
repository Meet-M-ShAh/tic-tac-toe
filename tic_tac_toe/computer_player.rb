class ComputerPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        pos = legal_positions.sample
        puts "#{self.mark} : #{pos.to_s}"
        return pos
    end
end