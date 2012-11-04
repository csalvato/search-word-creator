module WordSearchPuzzlesHelper
	
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
			puzzle[:solutions].push(insert_into_puzzle(word, puzzle))

		end

		return puzzle
	end


	def print_puzzle_to_console(grid)
		puts
		puzzle.each_with_index do |row, row_num|
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
			# Create the alphabet
			alphabet = ('A'..'Z').to_a

			# Create grid of letters
			grid = []
			grid_size.times.with_index do |row|
				grid[row] = []
				grid_size.times.with_index do |column|
					grid[row][column] = alphabet.shuffle[0]
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
			roll = rand(0..3)
			if roll == 0
				insert_into_puzzle_horiz(word, puzzle)
			elsif roll == 1
				insert_into_puzzle_vert(word, puzzle)
			elsif roll == 2
				insert_into_puzzle_diag_up(word, puzzle)
			else
				insert_into_puzzle_diag_down(word, puzzle)
			end
		end

		def insert_into_puzzle_horiz(word, puzzle)
			solution = {}

			max_start_column = puzzle[:grid][0].length - word.length
			
			row = rand(0..puzzle[:grid].length-1)
			col = rand(0..max_start_column)
			
			word.each_with_index do |letter, index|
				puzzle[:grid][row][col+index] = letter
				solution.merge!( [row, col+index] => letter)
			end
			return solution
		end

		def insert_into_puzzle_vert(word, puzzle)
			solution = {}
			max_start_row = puzzle[:grid].length - word.length
			row = rand(0..max_start_row)
			col = rand(0..puzzle[:grid][0].length)
			
			word.each_with_index do |letter, index|
				puzzle[:grid][row+index][col] = letter
				solution.merge!( [row+index, col] => letter )
			end
			return solution
		end
			
		def insert_into_puzzle_diag_down(word, puzzle)
			solution = {}

			max_start_row = puzzle[:grid].length - word.length
			max_start_column = puzzle[:grid][0].length - word.length
			row = rand(0..max_start_row)
			col = rand(0..max_start_column)
			
			word.each_with_index do |letter, index|
				puzzle[:grid][row+index][col+index] = letter
				solution.merge!([row+index, col+index] => letter)
			end
			return solution
		end

		def insert_into_puzzle_diag_up(word, puzzle)
			solution = {}			

			min_start_row = word.length
			max_start_column = puzzle[:grid][0].length - word.length

			row = rand(min_start_row..puzzle[:grid].length-1)
			col = rand(0..max_start_column)
			
			word.each_with_index do |letter, index|
				puzzle[:grid][row-index][col+index] = letter
				solution.merge!( [row-index, col+index] => letter )
			end
			return solution
		end	

end
