require "prawn/measurement_extensions"

module ApplicationHelper
	class SearchWordDocument < Prawn::Document
    def initialize(opts={ margin: 0.25.in })
      super
      move_to 0, 10.5.in
      stroke do
      	line_to 0, 10.5.in-8.in 		# Left side
      	line_to 8.in, 10.5.in-8.in  # Bottom side
				line_to 8.in, 10.5.in 			# Right side
      	line_to 0, 10.5.in 			 		# Top side
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
    	# 0.064 cm is the padding between letters on either side
    	# 1.128 cm is the total size of the text box
    	col = (grid_position[0]* 1.128.cm)
    	row = 10.5.in - 0.128.cm - (grid_position[1]* 1.128.cm )
    	text_box letter, at: [col, row], 
    									 :size => 1.cm,
    									 :width => 1.128.cm,
    									 :height => 1.128.cm,
    									 :align => :center
    end
  end
end
