require "prawn/measurement_extensions"

# Subclass of Prawn::Document to create word search puzzles.
class SearchWordDocument < Prawn::Document
  attr_accessor :grid_size, :row_offset, :col_offset, :swgrid, :solutions

  def initialize(opts={ margin: @margin=0.5.in })
    super
    @swgrid = []
    @solutions = {}
    @grid_size = 18
    @row_offset = 0
    @col_offset = 1
  end

  def draw_puzzle(puzzle)
		define_grid(columns: @grid_size + 2,
                rows: @grid_size + 7)
    grid([@row_offset,@col_offset], 
         [@row_offset + @grid_size - 1, @col_offset + @grid_size - 1]).bounding_box do
      stroke do 
        rounded_rectangle bounds.top_left, bounds.width, bounds.height, 10
      end
    end

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

  # Class methods to generate the word search puzzles
	#
	# @param words Array of words for the puzzle
	def generate_puzzle(words, grid_size)
		# Create the grid and solutions containers
		puzzle = { grid: SearchWordDocument.initialize_grid(grid_size), solutions: [] }
		
		words = words.each_with_index do |word, index| 
			# Turn words into letters
			word = word.upcase.split('')

			# Inject words into the puzzle
			SearchWordDocument.insert_into_puzzle(word, puzzle)
		end

		SearchWordDocument.fill_grid_with_random_letters(puzzle[:grid])

		return puzzle
	end

	def print_puzzle_to_console
		puts
		@swgrid.each_with_index do |row, row_num|
				print " " if row_num < 10
				print row_num.inspect + " - " + row.to_s
				puts
		end
	end

	def print_solutions_to_console
		puts
		@solutions.each do |solution|
				print solution.to_s
				puts
		end
	end

	def self.initialize_grid(grid_size)
		# Create grid of letters
		grid = []
		grid_size.times.with_index do |row|
			grid[row] = []
			grid_size.times.with_index do |column|
				grid[row][column] = nil
			end
		end
		return grid
	end

	def self.fill_grid_with_random_letters(grid)
		# Create the alphabet
		alphabet = ('A'..'Z').to_a

		grid.length.times.with_index do |row|
			grid[0].length.times.with_index do |column|
				grid[row][column] = alphabet.shuffle[0] if grid[row][column].nil?
			end
		end
		return grid
	end

	def self.collision?(solutions, row, col, letter)
		# Merge together existing solutions
		# This gives a hash with all grid positions that are "taken"
		all_taken_positions = {}

		solutions.each do |solution|
			all_taken_positions.merge!(solution)
		end
		
		# Check if the position being attempted is taken
		position_value = all_taken_positions.values_at([row,col])[0]
		return true unless position_value.nil? || (position_value == letter)
		return false
	end

	def self.insert_into_puzzle(word, puzzle)
		count = 0
		inserted = false

		while !inserted && count < 10
			roll = rand(0..3)
			if roll == 0
				inserted = insert_into_puzzle_horiz(word, puzzle)
			elsif roll == 1
				inserted = insert_into_puzzle_vert(word, puzzle)
			elsif roll == 2
				inserted = insert_into_puzzle_diag_up(word, puzzle)
			else
				inserted = insert_into_puzzle_diag_down(word, puzzle)
			end
			count += 1
		end
	end

	def self.insert_letter_into_puzzle(letter, row, col, puzzle)
		if collision?(puzzle[:solutions], row, col, letter) 
			return false
		else
			puzzle[:grid][row][col] = letter
		  return true
		end
	end

	def self.insert_word(word, row, col, puzzle)
		word.delete_if {|letter| letter == " " || letter == "-" }

		solution = {}
		word.each_with_index do |letter, index|
			break unless 
				insert_letter_into_puzzle(letter, 
																	row[:location], 
																	col[:location], 
																	puzzle)
			solution.merge!([row[:location], col[:location]] => letter)
			row[:location] += row[:increment]
			col[:location] += col[:increment]
			if index == word.length-1 
				puzzle[:solutions].push(solution)
				return true
			end
		end
		return false
	end

	def self.insert_into_puzzle_horiz(word, puzzle)
		max_start_column = puzzle[:grid][0].length - word.length
		row = rand(0..puzzle[:grid].length-1)
		col = rand(0..max_start_column)
		
		return insert_word(word, 
											  row = { location: row, increment: 0}, 
											  col = { location: col, increment: 1},
											  puzzle )
	end

	def self.insert_into_puzzle_vert(word, puzzle)
		max_start_row = puzzle[:grid].length - word.length
		row = rand(0..max_start_row)
		col = rand(0..puzzle[:grid][0].length-1)
		
		return insert_word(word, 
											  row = { location: row, increment: 1}, 
											  col = { location: col, increment: 0},
											  puzzle )
	end
		
	def self.insert_into_puzzle_diag_down(word, puzzle)
		max_start_row = puzzle[:grid].length - word.length
		max_start_column = puzzle[:grid][0].length - word.length
		row = rand(0..max_start_row)
		col = rand(0..max_start_column)
		
		return insert_word(word, 
								  row = { location: row, increment: 1}, 
								  col = { location: col, increment: 1},
								  puzzle )
	end

	def self.insert_into_puzzle_diag_up(word, puzzle)
		min_start_row = word.length
		max_start_column = puzzle[:grid][0].length - word.length
		row = rand(min_start_row..puzzle[:grid].length-1)
		col = rand(0..max_start_column)
		
		return insert_word(word, 
								  row = { location: row, increment: -1}, 
								  col = { location: col, increment: 1},
								  puzzle )
	end	

	def self.generate_pdf(words, grid_size, num_puzzles, name)
		pdf = SearchWordDocument.new
		random_characters = ('a'..'z').to_a.shuffle[0..7].join
		file_name = "#{name}_#{random_characters}.pdf"
		
		num_puzzles.times.with_index do |index|
			puzzle = pdf.generate_puzzle(words, grid_size)
			pdf.draw_puzzle(puzzle)
			pdf.draw_word_bank(puzzle)
			pdf.start_new_page
			pdf.draw_puzzle(puzzle)
			pdf.draw_word_bank(puzzle)
			pdf.highlight_solutions(puzzle)
			pdf.start_new_page unless index + 1 == num_puzzles
		end
		pdf.render_file "#{Rails.root.to_s}/tmp/#{file_name}" unless Rails.env.test?
		return file_name
	end
end
