require "prawn/measurement_extensions"

module ApplicationHelper
	class SearchWordDocument < Prawn::Document
    attr_accessor :margin, :puzzle_box_size, :top_of_page, :grid_size

    def initialize(opts={ margin: @margin=0.5.in })
      super
      @grid_size = 18
      @top_of_page = 11.in-(@margin*2)
      @puzzle_box_size = 8.5.in-(@margin*2)

      draw_puzzle_box
    end
    
    def draw_puzzle_box
      top_left = { x: 0, y: top_of_page }
      top_right = { x: puzzle_box_size, y: top_of_page }
      bottom_left = { x: 0, y: top_of_page - puzzle_box_size }
      bottom_right = { x: puzzle_box_size, y: top_of_page-puzzle_box_size }

      move_to top_left[:x], top_left[:y]
      stroke do
        line_to bottom_left[:x], bottom_left[:y]
        line_to bottom_right[:x], bottom_right[:y]
        line_to top_right[:x], top_right[:y]
        line_to top_left[:x], top_left[:y]
      end
    end


    def create_search_word_document(puzzle)
    	rows_count = puzzle[:grid].length
			cols_count = puzzle[:grid][0].length

    	rows_count.times.with_index do |row|
      	cols_count.times.with_index do |col|
      		draw_letter([col,row], puzzle[:grid][row][col])
      	end
      end
    end

    def draw_letter(grid_position, letter)
      letter_box_size = @puzzle_box_size/@grid_size

    	# 0.064 cm is the padding between letters on either side
    	# 1.128 cm is the total size of the text box
    	col = (grid_position[0]* letter_box_size)
    	row = top_of_page - (letter_box_size * 0.10) - (grid_position[1]* letter_box_size )
    	text_box letter, at: [col, row], 
    									 :size => 1.cm,
    									 :width => 1.128.cm,
    									 :height => 1.128.cm,
    									 :align => :center
    end
  end
end
