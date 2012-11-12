module WordSearchPuzzlesHelper
	include ApplicationHelper

	# Generates the word search puzzle
	#
	# @param words Array of words for the puzzle

	def generate_puzzle(words, grid_size)
		# Create the grid and solutions containers
		puzzle = { grid: initialize_grid(grid_size), solutions: [] }
		
		words = words.each_with_index do |word, index| 
			# Turn words into letters
			word = word.upcase.split('')

			# Inject words into the puzzle
			insert_into_puzzle(word, puzzle)
		end

		fill_grid_with_random_letters(puzzle[:grid])

		return puzzle
	end

	def print_puzzle_to_console(grid)
		puts
		grid.each_with_index do |row, row_num|
				print " " if row_num < 10
				print row_num.inspect + " - " + row.to_s
				puts
		end
	end

	def print_solutions_to_console(solutions)
		puts
		solutions.each do |solution|
				print solution.to_s
				puts
		end
	end

	private
		def initialize_grid(grid_size)
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

		def fill_grid_with_random_letters(grid)
			# Create the alphabet
			alphabet = ('A'..'Z').to_a

			grid.length.times.with_index do |row|
				grid[0].length.times.with_index do |column|
					grid[row][column] = alphabet.shuffle[0] if grid[row][column].nil?
				end
			end
			return grid
		end

		def collision?(solutions, row, col, letter)
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

		def insert_into_puzzle(word, puzzle)
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

		def insert_letter_into_puzzle(letter, row, col, puzzle)
			if collision?(puzzle[:solutions], row, col, letter) 
				return false
			else
				puzzle[:grid][row][col] = letter
			  return true
			end
		end

		def insert_word(word, row, col, puzzle)
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

		def insert_into_puzzle_horiz(word, puzzle)
			max_start_column = puzzle[:grid][0].length - word.length
			row = rand(0..puzzle[:grid].length-1)
			col = rand(0..max_start_column)
			
			return insert_word(word, 
												  row = { location: row, increment: 0}, 
												  col = { location: col, increment: 1},
												  puzzle )
		end

		def insert_into_puzzle_vert(word, puzzle)
			max_start_row = puzzle[:grid].length - word.length
			row = rand(0..max_start_row)
			col = rand(0..puzzle[:grid][0].length)
			
			return insert_word(word, 
												  row = { location: row, increment: 1}, 
												  col = { location: col, increment: 0},
												  puzzle )
		end
			
		def insert_into_puzzle_diag_down(word, puzzle)
			max_start_row = puzzle[:grid].length - word.length
			max_start_column = puzzle[:grid][0].length - word.length
			row = rand(0..max_start_row)
			col = rand(0..max_start_column)
			
			return insert_word(word, 
									  row = { location: row, increment: 1}, 
									  col = { location: col, increment: 1},
									  puzzle )
		end

		def insert_into_puzzle_diag_up(word, puzzle)
			min_start_row = word.length
			max_start_column = puzzle[:grid][0].length - word.length
			row = rand(min_start_row..puzzle[:grid].length-1)
			col = rand(0..max_start_column)
			
			return insert_word(word, 
									  row = { location: row, increment: -1}, 
									  col = { location: col, increment: 1},
									  puzzle )
		end	

		def generate_pdf(puzzle)
			pdf = SearchWordDocument.new
			pdf.draw_puzzle(puzzle)
			pdf.render_file "app/assets/generated_pdfs/test.pdf"
		end
end
