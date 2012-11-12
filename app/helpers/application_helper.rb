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

    def circle_solutions(puzzle)
    end

    def draw_word_bank
    end
  end
end
