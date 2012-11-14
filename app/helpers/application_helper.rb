require "prawn/measurement_extensions"

module ApplicationHelper
	class SearchWordDocument < Prawn::Document
    attr_accessor :grid_size, :row_offset, :col_offset

    def initialize(opts={ margin: @margin=0.5.in })
      super
      @grid_size = 18
      @row_offset = 0
      @col_offset = 1
      
      define_grid(columns: @grid_size + 2,
                  rows: @grid_size + 7)
      grid([@row_offset,@col_offset], 
           [@row_offset + @grid_size - 1, @col_offset + @grid_size - 1]).bounding_box do
        stroke do 
          rounded_rectangle bounds.top_left, bounds.width, bounds.height, 10
        end
      end
    end

    def draw_puzzle(puzzle)
      rows_count = puzzle[:grid].length
      cols_count = puzzle[:grid][0].length

      rows_count.times.with_index do |row|
        cols_count.times.with_index do |col|
         grid(row + @row_offset, col + @col_offset).bounding_box do
          text puzzle[:grid][row][col], 
               size: 0.75.cm, 
               align: :center, 
               valign: :center
         end
        end
      end
    end

    def highlight_solutions(puzzle)
      puzzle[:solutions].each do |solution|
        solution.each do |coordinates, letter|
          grid( coordinates[0] + @row_offset, coordinates[1]+ @col_offset ).bounding_box do
            rectangle bounds.top_left, bounds.width, bounds.height
            stroke
          end
        end
      end
    end

    def draw_word_bank(puzzle)
      columns = ['', '', '']

      puzzle[:solutions].each_with_index do |solution, index|
        columns[index % 3] += solution.values.join + "\n"
      end

      puts columns

      grid([19,1], [23,5]).bounding_box do
        text columns[0]  
      end
      grid([19,7], [23,11]).bounding_box do
        text columns[1]
      end

      grid([19,13], [23,18]).bounding_box do
        text columns[2]
      end
    end
  end
end
