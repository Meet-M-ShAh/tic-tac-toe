class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, "_") }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def valid?(pos)
        row, col = pos
        pos.all? do |i|
            0 <= i && i < @grid.length
        end
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        raise "CHECK THE INPUT LOCATION" if !valid?(pos) || !empty?(pos)
        self[pos] = mark
    end

    def print
        marks = []
        @grid.each_with_index do |row, i|
            row.each_with_index do |ele, j|
                if ele != "_"
                    marks << [i, j]
                end
            end
            p row
            puts
        end
        return marks
    end

    def win_row?(mark)
        return @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        return @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win_diagonal?(mark)
        left_dia = (0...@grid.length).all? do |i|
            pos = i, i
            self[pos] == mark
        end

        right_dia = (0...@grid.length).all? do |i|
            row = i
            col = @grid.length-1-i
            pos = row, col
            self[pos] == mark
        end

        return left_dia || right_dia
    end

    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
        return false
    end

    def empty_positions?
        i = (0...@grid.length).to_a
        pos = i.product(i)
        pos.any? { |p| empty?(p) }
    end

    def legal_positions
        i = (0...@grid.length).to_a
        pos = i.product(i)
        pos.select { |p| empty?(p) }
    end
end